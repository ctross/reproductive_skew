################################################################################
## Estimation Of M Using SkewCalc R package

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Population-Level Data Sets for Meta-Analysis'))
 
 dman <- read.csv("Human_PointEstimates_Male.csv")

 I_index <- dman$Var/(dman$Mean^2)
 N_m_1 <- dman$N0 - 1
 R <- dman$Mean*dman$N0

 dman$M_Posterior_Estimate <- I_index - (N_m_1/R)
 
########################################
 setwd(paste0(basewd,'/Results'))
 write.csv(dman,"SkewResults-Published-Male.csv")
 setwd(basewd)



