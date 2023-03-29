########################### Set working directory and load required packages
 library(rethinking)
 library(ape)
 library(caper)
 library(reshape2)
 library(scales)
 library(ggplot2)
 library(SkewCalc)
 library(ggridges)
 library(viridis)
 library(plyr)
 library(wesanderson)
 library(stringr)
 library(ggrepel)
 library(ggpubr)
 library(xtable)
 library(phytools)

 basewd = 'C:\\Users\\cody_ross\\Dropbox\\Completed and Published Projects\\1-papers\\Reproductive Skew\\PublicationWorkflow'
 setwd(basewd)

source("Code/Support_Functions.R")

########################### First, run theoretical simulation model
source("Code/Skew_Simulation.R")          # Exports two plots for main paper
source("Code/Skew_Simulation_Extra.R")    # Exports three plots for SOM

########################### Next process the individual-level datasets
source("Code/EstimationOfM-NonHumanDatasets-Male.R")    
source("Code/EstimationOfM-NonHumanDatasets-Female.R") 

source("Code/EstimationOfM-HumanDatasets-Male.R")      
source("Code/EstimationOfM-HumanDatasets-Female.R") 

########################### Next process the population-level datasets
source("Code/EstimationOfM-PublishedNonHumanPairedDatasets-Male.R")      
source("Code/EstimationOfM-PublishedNonHumanPairedDatasets-Female.R") 

source("Code/EstimationOfM-PublishedNonHumanUnpairedDatasets-Male.R")      
source("Code/EstimationOfM-PublishedNonHumanUnpairedDatasets-Female.R") 

########################### Now merge final data and then prune down to one point per species/group
source("Code/Merge_Data.R")    
source("Code/Prepare_Data.R") 

########################### Now merge final data and then prune down to one point per species/group
source("Code/Descriptive_Plots.R")    

########################### Test predictions
source("Code/Prediction_1.R")    
source("Code/Prediction_2.R")    
source("Code/Prediction_3.R")    

########################### Added tests
source("Code/Phylogeny.R")  
source("Code/Check_Estimates.R")  

########################### Retest predictions on highest quality datasets
source("Code/Prediction_1_Robustness.R")    
source("Code/Prediction_2_Robustness.R")    
source("Code/Prediction_3_Robustness.R")    

