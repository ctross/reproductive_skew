################################################################################
## Estimation Of M Using SkewCalc R package
## Non-Human Female Data Sets

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Individual-Level Non-Human Data Sets/Females'))

############################################################ Female Data
dChimp1F<-read.csv("Gagneux1999-TaiChimpanzee-Female.csv")
dRhino1F<-read.csv("Garnier2001-BlackRhinoceros-Female.csv")
dHyena1F<-read.csv("HolekampTable2-SpottedHyena-Female.csv")
dChimp2F<-read.csv("Inoue2008-MahaleChimpanzee-Female.csv")
dBlackBear1F<-read.csv("Kovach2003-BlackBear-Female.csv")
dCapuchin1F<-read.csv("Perry-WhiteFacedCapuchin-Female.csv")
dChimp3F<-read.csv("PuseyOct2014-GombeChimpanzee-Female.csv")
dBonobo2F<-read.csv("Surbek-LuiKotaleBonobo-Female.csv")
dMuruiquiF<-read.csv("Strier-Muriqui-Female.csv")
dChimp4F<-read.csv("NewtonFisher2010-BudongoChimpanzee-Female.csv")
dGorilla1F<-read.csv("Bradley2005Robbins2011-MountainGorilla-Female.csv")
dBat1F<-read.csv("Kerth2002-BlutseeBechsteinsBat-Female.csv")
dBat2F<-read.csv("Kerth2002-GuttenbergBechsteinsBat-Female.csv")
dBat3F<-read.csv("Kerth2002-HochbergBechsteinsBat-Female.csv")
dBat4F<-read.csv("Kerth2002-UnteraltertheimBechsteinsBat-Female.csv")
dTamarinF<-read.csv("Henry2013-GoldenLionTamarin-Female.csv")
dHareF<-read.csv("Burton2002-SnowshoeHare-Female.csv")
dSheepF<-read.csv("CluttonBrock1996-SoaySheep-Female.csv")

##############################################################################
 ResNHF = matrix(NA,nrow=25,ncol=36)
 Labels  =  c("Population_fem","Ethnographer_fem","Location_fem","Production_System_fem","RS_Type_fem","Sample_fem","N25_fem","RS0A25_fem","PercRS0A25_fem",
             "N45_fem","RS0A45_fem","PercRS0A45_fem","N0_fem","RSsum_fem","Exposuresum_fem","RSmean_fem","RSsd_fem","RSvar_fem","RScv_fem", "RSofs_fem","Gini_fem",
             "RateGini_fem","Bindex_fem","Mraw_index_fem","M_index_fem",
             "Mraw_Posterior_Estimate_fem","M_Posterior_Estimate_fem",
             "Mraw_Posterior_EstimateL_fem","M_Posterior_EstimateL_fem",
             "Mraw_Posterior_EstimateH_fem", "M_Posterior_EstimateH_fem", 
             "Mraw_Posterior_EstimateSD_fem","M_Posterior_EstimateSD_fem",
             "Gamma_fem", "Gamma_L_fem","Gamma_H_fem")

colnames(ResNHF) = Labels

setwd(paste0(basewd,'/Results/Females_NHM')) 

 ############################################################### Fill Female Results
 ResNHF[1,]<-c("Chimpanzee[1]","Gagneux","Tai", "NA","NA","NA",
              MergeRes(ceiling(dChimp1F$time),round(dChimp1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[1]_Female_Gagneux_M")
              skew_scatter_plot(dChimp1F$time, dChimp1F$rs, Save="Chimp[1]_Female_Gagneux_Scatter")
              skew_trace_plot(dChimp1F$time, Save="Chimp[1]_Female_Gagneux_Trace",Thresh=1)    

 ResNHF[2,]<-c("BlackRhinoceros","Garnier","NA", "NA","NA","NA",
              MergeRes(ceiling(dRhino1F$time),round(dRhino1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BlackRhinoceros_Female_Garnier_M")
              skew_scatter_plot(dRhino1F$time, dRhino1F$rs, Save="BlackRhinoceros_Female_Garnier_Scatter")
              skew_trace_plot(dRhino1F$time, Save="BlackRhinoceros_Female_Garnier_Trace",Thresh=1) 

 ResNHF[3,]<-c("SpottedHyena","Holekamp","NA", "NA","NA","NA",
              MergeRes(ceiling(dHyena1F$time),round(dHyena1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SpottedHyena_Female_Holekamp_M")
              skew_scatter_plot(dHyena1F$time, dHyena1F$rs, Save="SpottedHyena_Female_Holekamp_Scatter")
              skew_trace_plot(dHyena1F$time, Save="SpottedHyena_Female_Female_Trace",Thresh=1) 

 ResNHF[4,]<-c("Chimpanzee[2]","Inoue","Mahale", "NA","NA","NA",
              MergeRes(ceiling(dChimp2F$time),round(dChimp2F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[2]_Female_Inoue_M")
              skew_scatter_plot(dChimp2F$time, dChimp2F$rs, Save="Chimp[2]_Female_Inoue_Scatter")
              skew_trace_plot(dChimp2F$time, Save="Chimp[2]_Female_Inoue_Trace",Thresh=1) 

 ResNHF[5,]<-c("BlackBear","Kovach","NA", "NA","NA","NA",
              MergeRes(ceiling(dBlackBear1F$time),round(dBlackBear1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BlackBear_Female_Kovach_M")
              skew_scatter_plot(dBlackBear1F$time, dBlackBear1F$rs, Save="BlackBear_Female_Kovach_Scatter")
              skew_trace_plot(dBlackBear1F$time, Save="BlackBear_Female_Kovach_Trace",Thresh=1) 

 ResNHF[6,]<-c("WhiteFacedCapuchin","Perry","NA", "NA","NA","NA",
              MergeRes(ceiling(dCapuchin1F$time),round(dCapuchin1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="WhiteFacedCapuchin_Female_Perry_M")
              skew_scatter_plot(dCapuchin1F$time, dCapuchin1F$rs, Save="WhiteFacedCapuchin_Female_Perry_Scatter")
              skew_trace_plot(dCapuchin1F$time, Save="WhiteFacedCapuchin_Female_Perry_Trace",Thresh=1) 

 ResNHF[7,]<-c("Chimpanzee[3]","Pusey","Gombe", "NA","NA","NA",
              MergeRes(ceiling(dChimp3F$time),round(dChimp3F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[3]_Female_Pusey_M")
              skew_scatter_plot(dChimp3F$time, dChimp3F$rs, Save="Chimp[3]_Female_Pusey_Scatter")
              skew_trace_plot(dChimp3F$time, Save="Chimp[3]_Female_Pusey_Trace",Thresh=1) 

 ResNHF[8,]<-c("Bonobo[2]","Surbek","LuiKotale", "NA","NA","NA",
              MergeRes(ceiling(dBonobo2F$time),round(dBonobo2F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Bonobo[2]_Female_Surbek_M")
              skew_scatter_plot(dBonobo2F$time, dBonobo2F$rs, Save="Bonobo[2]_Female_Surbek_Scatter")
              skew_trace_plot(dBonobo2F$time, Save="Bonobo[2]_Female_Surbek_Trace",Thresh=1) 

#ResNHF[9,]<-c("Bonobo[1]","Gerloff","Lomako", # No Data

#ResNHF[10,]<-c("FurSeal","Hoffman","Antarctic", # No Data

#ResNHF[11,]<-c("NorthernChamois","Corlatti", # No Data

#ResNHF[12,]<-c("SeaLion[1]","Porschmann","Galapagos", # No Data

#ResNHF[13,]<-c("SeaLion[2]","Porschmann","Galapagos", # No Data

#ResNHF[14,]<-c("AfricanElephant","Rasmussen", # No Data

 ResNHF[15,]<-c("MountainGorilla","Bradley and Robbins","NA", "NA","NA","NA",
              MergeRes(ceiling(dGorilla1F$time),round(dGorilla1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="MountainGorilla_Female_BradleyRobbins_M")
              skew_scatter_plot(dGorilla1F$time, dGorilla1F$rs, Save="MountainGorilla_Female_BradleyRobbins_Scatter")
              skew_trace_plot(dGorilla1F$time, Save="MountainGorilla_Female_BradleyRobbins_Trace",Thresh=1) 

 ResNHF[16,]<-c("Chimpanzee[4]","NewtonFisher","Budongo", "NA","NA","NA",
              MergeRes(ceiling(dChimp4F$time),round(dChimp4F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimpanzee[4]_Female_NewtonFisher_M")
              skew_scatter_plot(dChimp4F$time, dChimp4F$rs, Save="Chimpanzee[4]_Female_NewtonFisher_Scatter")
              skew_trace_plot(dChimp4F$time, Save="Chimpanzee[4]_Female_NewtonFisher_Trace",Thresh=1) 

#ResNHF[17,]<- c("RhesusMacaque","Sauermann", # No Data

 ResNHF[18,]<-c("Muriqui","Strier","NA", "NA","NA","NA",
              MergeRes(ceiling(dMuruiquiF$time),round(dMuruiquiF$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Muriqui_Female_Strier_M")
              skew_scatter_plot(dMuruiquiF$time, dMuruiquiF$rs, Save="Muriqui_Female_Strier_Scatter")
              skew_trace_plot(dMuruiquiF$time, Save="Muriqui_Female_Strier_Trace",Thresh=1) 

 ResNHF[19,]<-c("BechsteinsBat[1]","Kerth","Blutsee", "NA","NA","NA",
              MergeRes(ceiling(dBat1F$time),round(dBat1F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BechsteinsBat[1]_Female_Kerth_M")
              skew_scatter_plot(dBat1F$time, dBat1F$rs, Save="BechsteinsBat[1]_Female_Kerth_Scatter")
              skew_trace_plot(dBat1F$time, Save="BechsteinsBat[1]_Female_Kerth_Trace",Thresh=1) 

 ResNHF[20,]<-c("BechsteinsBat[2]","Kerth","Guttenberg", "NA","NA","NA",
              MergeRes(ceiling(dBat2F$time),round(dBat2F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BechsteinsBat[2]_Female_Kerth_M")
              skew_scatter_plot(dBat2F$time, dBat2F$rs, Save="BechsteinsBat[2]_Female_Kerth_Scatter")
              skew_trace_plot(dBat2F$time, Save="BechsteinsBat[2]_Female_Kerth_Trace",Thresh=1) 

 ResNHF[21,]<-c("BechsteinsBat[3]","Kerth","Hochberg", "NA","NA","NA",
              MergeRes(ceiling(dBat3F$time),round(dBat3F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BechsteinsBat[3]_Female_Kerth_M")
              skew_scatter_plot(dBat3F$time, dBat3F$rs, Save="BechsteinsBat[3]_Female_Kerth_Scatter")
              skew_trace_plot(dBat3F$time, Save="BechsteinsBat[3]_Female_Kerth_Trace",Thresh=1) 

 ResNHF[22,]<-c("BechsteinsBat[4]","Kerth","Unteraltertheim", "NA","NA","NA",
              MergeRes(ceiling(dBat4F$time),round(dBat4F$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BechsteinsBat[4]_Female_Kerth_M")
              skew_scatter_plot(dBat4F$time, dBat4F$rs, Save="BechsteinsBat[4]_Female_Kerth_Scatter")
              skew_trace_plot(dBat4F$time, Save="BechsteinsBat[4]_Female_Kerth_Trace",Thresh=1)   

 ResNHF[23,]<-c("GoldenLionTamarin","Henry","NA", "NA","NA","NA",
              MergeRes(ceiling(dTamarinF$time),round(dTamarinF$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="GoldenLionTamarin_Female_Henry_M")
              skew_scatter_plot(dTamarinF$time, dTamarinF$rs, Save="GoldenLionTamarin_Female_Henry_Scatter")
              skew_trace_plot(dTamarinF$time, Save="GoldenLionTamarin_Female_Henry_Trace",Thresh=1)                  

 ResNHF[24,]<-c("SnowshoeHare","Burton","NA", "NA","NA","NA",
              MergeRes(ceiling(dHareF$time),round(dHareF$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SnowshoeHare_Female_Burton_M")
              skew_scatter_plot(dHareF$time, dHareF$rs, Save="SnowshoeHare_Female_Burton_Scatter")
              skew_trace_plot(dHareF$time, Save="SnowshoeHare_Female_Burton_Trace",Thresh=1)                  

 ResNHF[25,]<-c("SoaySheep","CluttonBrock","NA", "NA","NA","NA",
              MergeRes(ceiling(dSheepF$time),round(dSheepF$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SoaySheep_Female_CluttonBrock_M")
              skew_scatter_plot(dSheepF$time, dSheepF$rs, Save="SoaySheep_Female_CluttonBrock_Scatter")
              skew_trace_plot(dSheepF$time, Save="SoaySheep_Female_CluttonBrock_Trace",Thresh=1)                  

########################################
 setwd(paste0(basewd,'/Results'))
 save.image("SkewResNH_F.RData")
 dnhmF <- data.frame(ResNHF)
 colnames(dnhmF) <- colnames(ResNHF)
 write.csv(ResNHF, "SkewResults-Individual-NHM-Female.csv")
 setwd(basewd)
























