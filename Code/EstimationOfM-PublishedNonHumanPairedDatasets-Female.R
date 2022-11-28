################################################################################
## Estimation Of M Using SkewCalc R package

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Population-Level Data Sets for Meta-Analysis'))
 
 dnh <- read.csv("ReproSkewNHMPublishedData-Paired-Female.csv")

 dnh$N[12] = 43 # Missing sample, so assume that its the same as the male horses  in the same study.
 dnh$N[13] = 43 # Missing sample, so assume that its the same as above

 I_index <- dnh$Var/(dnh$Mean^2)
 N_m_1 <- dnh$N - 1
 R <- dnh$Mean*dnh$N

 dnh$M_Posterior_Estimate <- I_index - (N_m_1/R)

 dnh$R<-round(dnh$K,0)

 for( i in 1:length(dnh$M_Posterior_Estimate))
 if(is.na(dnh$M_Posterior_Estimate[i]) & !is.na(dnh$N[i]))
 dnh$M_Posterior_Estimate[i] <- M_index_from_B_index(dnh$B[i],dnh$R[i],dnh$N[i])

dnh$M_Posterior_Estimate_fem <- dnh$M_Posterior_Estimate
dnh$N0_fem <- round(dnh$N,0)
 
########################################
 setwd(paste0(basewd,'/Results'))
 write.csv(dnh,"SkewResults-Published-NHM-Paired-Female.csv")
 setwd(basewd)



