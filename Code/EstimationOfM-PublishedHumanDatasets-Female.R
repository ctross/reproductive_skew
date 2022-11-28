################################################################################
## Estimation Of M Using SkewCalc R package

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Population-Level Data Sets for Meta-Analysis'))
 
 dfem <- read.csv("Human_PointEstimates_Female.csv")

 I_index <- dfem$Var_fem/(dfem$Mean_fem^2)
 N_m_1 <- dfem$N0_fem - 1
 R <- dfem$Mean_fem*dfem$N0_fem

 dfem$M_Posterior_Estimate_fem <- I_index - (N_m_1/R)
 
########################################
 setwd(paste0(basewd,'/Results'))
 write.csv(dfem,"SkewResults-Published-Female.csv")
 setwd(basewd)



