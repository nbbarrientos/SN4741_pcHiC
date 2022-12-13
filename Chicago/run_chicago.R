options(warn=-1)

library(Chicago)
library(optparse)

arg_options = list(
  make_option(c("-m", "--main_dir"), default = ".", help = "Path of main directory where execution of Chicago occurs"),
  make_option(c("-i", "--input_files_dir"), help = "Name of directory where input files (.rmap, .baitmap, .nbpb, .npb, .poe) are located"),
  make_option(c("-r", "--chinput_dir"), help = "Name of directory where Chicago input file (.chinput) is located"),
  make_option(c("-c", "--chinput_name"), help = "Name of .chinput file name"),
  make_option(c("-n", "--out_prefix"), default = "chicago", help = "Prefix to give to output files"))

opt_parser = OptionParser(option_list = arg_options, description = "R script to run Chicago pipeline for analysis of pcHiC data")
opt = parse_args(opt_parser)

if (is.null(opt$input_files_dir) | is.null(opt$chinput_dir) | is.null(opt$chinput_name)) {
  print_help(opt_parser)
  stop("Required: Path to designDir directory. Path to .chinput file location. Name of .chinput file", call. = F)
}


#Generate the random number for the analysis
GenSeed <- floor(runif(1,min=1,max=1000000))
#Seed generated to run published results: 938545

#Set the working directory
#setwd("/work-zfs/amccall2/WDL/SN4741_CHiC_NovaSeq/CHiCAGO_Combined")

#Put the directory path into a variable
dataPath <- (opt$main_dir)

#Establish path to input files.
DesignDir <- file.path(dataPath, opt$input_files_dir)
dir(DesignDir)

#Establish path to .chinput file
RealDataPath <- file.path(dataPath, opt$chinput_dir)
dir(RealDataPath)

#Bring in the files
files <- c(file.path(RealDataPath, opt$chinput_name))

#Set up the experiment
cd <- setExperiment(designDir = DesignDir)

#Modify the setting to set the seed for reproducibility
cd <- modifySettings(cd, settings=list(brownianNoise.seed = GenSeed))

#Bring in the files
cd <- readAndMerge(files=files, cd=cd)

cd <- chicagoPipeline(cd, outprefix=opt$out_prefix)

exportResults(cd, file.path(dataPath, opt$out_prefix))

sprintf("Random seed was %i", GenSeed)

saveRDS(cd, file=paste0(opt$main_dir,"/",opt$out_prefix,".rds"))
