################################################################################
## Estimation Of M Using SkewCalc R package
## Non-Human Male Data Sets

###################################################################### Load Data
 setwd(paste0(basewd,'/Data/Individual-Level Non-Human Data Sets/Males'))

 dChimp1<-read.csv("Gagneux1999-TaiChimpanzee-Male.csv")
 dRhino1<-read.csv("Garnier2001-BlackRhinoceros-Male.csv")
 dHyena1<-read.csv("HolekampTable2-SpottedHyena-Male.csv")
 dChimp2<-read.csv("Inoue2008-MahaleChimpanzee-Male.csv")
 dBlackBear1<-read.csv("Kovach2003-BlackBear-Male.csv")
 dCapuchin1<-read.csv("Perry-WhiteFacedCapuchin-Male.csv")
 dChimp3<-read.csv("PuseyOct2014-GombeChimpanzee-Male.csv")
 dBonobo2<-read.csv("Surbek-LuiKotaleBonobo-Male.csv")
 dBonobo1<-read.csv("Gerloff1999-LomakoBonobo-Male.csv")
 dSeal1<-read.csv("Hoffman2003-AntarcticFurSeal-Male.csv")
 dChamois1<-read.csv("Corlatti2015-NorthernChamois-Male.csv")
 dSeaLion1<-read.csv("Porschmann2010-2006GalapagosSeaLion-Male.csv")
 dSeaLion2<-read.csv("Porschmann2010-2007GalapagosSeaLion-Male.csv")
 dElephant1<-read.csv("Rasmussen2008-AfricanElephant-Male.csv")
 dGorilla1<-read.csv("Bradley2005Robbins2011-MountainGorilla-Male.csv")
 dChimp4<-read.csv("NewtonFisher2010-BudongoChimpanzee-Male.csv")
 dRhesus1<-read.csv("Sauermann2001-RhesusMacaque-Male.csv")
 dMuriqui1<-read.csv("Strier-Muriqui-Male.csv")

##############################################################################
 ResNHM = matrix(NA,nrow=25,ncol=36)
 Labels  =  c("Population","Ethnographer","Location","Production System","RS Type","Sample","N25","RS0A25","PercRS0A25",
             "N45","RS0A45","PercRS0A45","N0","RSsum","Exposuresum","RSmean","RSsd","RSvar","RScv", "RSofs","Gini",
             "RateGini","Bindex","Mraw_index","M_index",
             "Mraw_Posterior_Estimate","M_Posterior_Estimate",
             "Mraw_Posterior_EstimateL","M_Posterior_EstimateL",
             "Mraw_Posterior_EstimateH", "M_Posterior_EstimateH", 
             "Mraw_Posterior_EstimateSD","M_Posterior_EstimateSD",
             "Gamma", "Gamma_L","Gamma_H")

colnames(ResNHM) = Labels

setwd(paste0(basewd,'/Results/Males_NHM')) 

 ############################################################### Fill Male Results
 ResNHM[1,]<-c("Chimpanzee[1]","Gagneux","Tai", "NA","NA","NA",
              MergeRes(ceiling(dChimp1$time),round(dChimp1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[1]_Male_Gagneux_M")
              skew_scatter_plot(dChimp1$time, dChimp1$rs, Save="Chimp[1]_Male_Gagneux_Scatter")
              skew_trace_plot(dChimp1$time, Save="Chimp[1]_Male_Gagneux_Trace",Thresh=1)   

 ResNHM[2,]<-c("BlackRhinoceros","Garnier","NA", "NA","NA","NA",
              MergeRes(ceiling(dRhino1$time),round(dRhino1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BlackRhinoceros_Male_Garnier_M")
              skew_scatter_plot(dRhino1$time, dRhino1$rs, Save="BlackRhinoceros_Male_Garnier_Scatter")
              skew_trace_plot(dRhino1$time, Save="BlackRhinoceros_Male_Garnier_Trace",Thresh=1) 

 ResNHM[3,]<-c("SpottedHyena","Holekamp","NA", "NA","NA","NA",
              MergeRes(ceiling(dHyena1$time),round(dHyena1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SpottedHyena_Male_Holekamp_M")
              skew_scatter_plot(dHyena1$time, dHyena1$rs, Save="SpottedHyena_Male_Holekamp_Scatter")
              skew_trace_plot(dHyena1$time, Save="SpottedHyena_Male_Holekamp_Trace",Thresh=1) 

 ResNHM[4,]<-c("Chimpanzee[2]","Inoue","Mahale", "NA","NA","NA",
              MergeRes(ceiling(dChimp2$time),round(dChimp2$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[2]_Male_Inoue_M")
              skew_scatter_plot(dChimp2$time, dChimp2$rs, Save="Chimp[2]_Male_Inoue_Scatter")
              skew_trace_plot(dChimp2$time, Save="Chimp[2]_Male_Inoue_Trace",Thresh=1) 

 ResNHM[5,]<-c("BlackBear","Kovach","NA", "NA","NA","NA",
              MergeRes(ceiling(dBlackBear1$time),round(dBlackBear1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="BlackBear_Male_Kovach_M")
              skew_scatter_plot(dBlackBear1$time, dBlackBear1$rs, Save="BlackBear_Male_Kovach_Scatter")
              skew_trace_plot(dBlackBear1$time, Save="BlackBear_Male_Kovach_Trace",Thresh=1) 

 ResNHM[6,]<-c("WhiteFacedCapuchin","Perry","NA", "NA","NA","NA",
              MergeRes(ceiling(dCapuchin1$time),round(dCapuchin1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="WhiteFacedCapuchin_Male_Perry_M")
              skew_scatter_plot(dCapuchin1$time, dCapuchin1$rs, Save="WhiteFacedCapuchin_Male_Perry_Scatter")
              skew_trace_plot(dCapuchin1$time, Save="WhiteFacedCapuchin_Male_Perry_Trace",Thresh=1) 

 ResNHM[7,]<-c("Chimpanzee[3]","Pusey","Gombe", "NA","NA","NA",
              MergeRes(ceiling(dChimp3$time),round(dChimp3$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimp[3]_Male_Pusey_M")
              skew_scatter_plot(dChimp3$time, dChimp3$rs, Save="Chimp[3]_Male_Pusey_Scatter")
              skew_trace_plot(dChimp3$time, Save="Chimp[3]_Male_Pusey_Trace",Thresh=1) 

 ResNHM[8,]<-c("Bonobo[2]","Surbek","LuiKotale", "NA","NA","NA",
              MergeRes(ceiling(dBonobo2$time),round(dBonobo2$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Bonobo[2]_Male_Surbek_M")
              skew_scatter_plot(dBonobo2$time, dBonobo2$rs, Save="Bonobo[2]_Male_Surbek_Scatter")
              skew_trace_plot(dBonobo2$time, Save="Bonobo[2]_Male_Surbek_Trace",Thresh=1) 

 ResNHM[9,]<-c("Bonobo[1]","Gerloff","Lomako", "NA","NA","NA",
              MergeRes(ceiling(dBonobo1$time),round(dBonobo1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Bonobo[1]_Male_Gerloff_M")
              skew_scatter_plot(dBonobo1$time, dBonobo1$rs, Save="Bonobo[1]_Male_Gerloff_Scatter")
              skew_trace_plot(dBonobo1$time, Save="Bonobo[1]_Male_Gerloff_Trace",Thresh=1) 

 ResNHM[10,]<-c("FurSeal","Hoffman","Antarctic", "NA","NA","NA",
              MergeRes(ceiling(dSeal1$time),round(dSeal1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="FurSeal_Male_Hoffman_M")
              skew_scatter_plot(dSeal1$time, dSeal1$rs, Save="FurSeal_Male_Hoffman_Scatter")
              skew_trace_plot(dSeal1$time, Save="FurSeal_Male_Hoffman_Trace",Thresh=1) 

 ResNHM[11,]<-c("NorthernChamois","Corlatti","NA", "NA","NA","NA",
              MergeRes(ceiling(dChamois1$time),round(dChamois1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="NorthernChamois_Male_Corlatti_M")
              skew_scatter_plot(dChamois1$time, dChamois1$rs, Save="NorthernChamois_Male_Corlatti_Scatter")
              skew_trace_plot(dChamois1$time, Save="NorthernChamois_Male_Corlatti_Trace",Thresh=1) 

 ResNHM[12,]<-c("SeaLion[1]","Porschmann","Galapagos", "NA","NA","NA",
              MergeRes(ceiling(dSeaLion1$time),round(dSeaLion1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SeaLion[1]_Male_Porschmann_M")
              skew_scatter_plot(dSeaLion1$time, dSeaLion1$rs, Save="SeaLion[1]_Male_Porschmann_Scatter")
              skew_trace_plot(dSeaLion1$time, Save="SeaLion[1]_Male_Porschmann_Trace",Thresh=1) 

 ResNHM[13,]<-c("SeaLion[2]","Porschmann","Galapagos", "NA","NA","NA",
              MergeRes(ceiling(dSeaLion2$time),round(dSeaLion2$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="SeaLion[2]_Male_Porschmann_M")
              skew_scatter_plot(dSeaLion2$time, dSeaLion2$rs, Save="SeaLion[2]_Male_Porschmann_Scatter")
              skew_trace_plot(dSeaLion2$time, Save="SeaLion[2]_Male_Porschmann_Trace",Thresh=1) 

 ResNHM[14,]<-c("AfricanElephant","Rasmussen","NA", "NA","NA","NA",
              MergeRes(ceiling(dElephant1$time),round(dElephant1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="AfricanElephant_Male_Rasmussen_M")
              skew_scatter_plot(dElephant1$time, dElephant1$rs, Save="AfricanElephant_Male_Rasmussen_Scatter")
              skew_trace_plot(dElephant1$time, Save="AfricanElephant_Male_Rasmussen_Trace",Thresh=1) 

 ResNHM[15,]<-c("MountainGorilla","Bradley and Robbins","NA", "NA","NA","NA",
              MergeRes(ceiling(dGorilla1$time),round(dGorilla1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="MountainGorilla_Male_BradleyRobbins_M")
              skew_scatter_plot(dGorilla1$time, dGorilla1$rs, Save="MountainGorilla_Male_BradleyRobbins_Scatter")
              skew_trace_plot(dGorilla1$time, Save="MountainGorilla_Male_BradleyRobbins_Trace",Thresh=1) 

 ResNHM[16,]<-c("Chimpanzee[4]","NewtonFisher","Budongo", "NA","NA","NA",
              MergeRes(ceiling(dChimp4$time),round(dChimp4$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Chimpanzee[4]_Male_NewtonFisher_M")
              skew_scatter_plot(dChimp4$time, dChimp4$rs, Save="Chimpanzee[4]_Male_NewtonFisher_Scatter")
              skew_trace_plot(dChimp4$time, Save="Chimpanzee[4]_Male_NewtonFisher_Trace",Thresh=1) 

 ResNHM[17,]<-c("RhesusMacaque","Sauermann","NA", "NA","NA","NA",
              MergeRes(ceiling(dRhesus1$time),round(dRhesus1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="RhesusMacaque_Male_Sauermann_M")
              skew_scatter_plot(dRhesus1$time, dRhesus1$rs, Save="RhesusMacaque_Male_Sauermann_Scatter")
              skew_trace_plot(dRhesus1$time, Save="RhesusMacaque_Male_Sauermann_Trace",Thresh=1) 

 ResNHM[18,]<-c("Muriqui","Strier","NA", "NA","NA","NA",
              MergeRes(ceiling(dMuriqui1$time),round(dMuriqui1$rs,0), NHM=TRUE))
              skew_index_plot("M", Age=TRUE, Save="Muriqui_Male_Strier_M")
              skew_scatter_plot(dMuriqui1$time, dMuriqui1$rs, Save="Muriqui_Male_Strier_Scatter")
              skew_trace_plot(dMuriqui1$time, Save="Muriqui_Male_Strier_Trace",Thresh=1) 

 #ResNHF[19,]<-c("BechsteinsBat[1]","Kerth","Blutsee", # No Data

 #ResNHF[20,]<-c("BechsteinsBat[2]","Kerth","Guttenberg", # No Data

 #ResNHF[21,]<-c("BechsteinsBat[3]","Kerth","Hochberg", # No Data

 #ResNHF[22,]<-c("BechsteinsBat[4]","Kerth","Unteraltertheim", # No Data 

 #ResNHF[23,]<-c("GoldenLionTamarin","Henry",# No Data             

 #ResNHF[24,]<-c("SnowshoeHare","Burton",# No Data               

 #ResNHF[25,]<-c("SoaySheep","CluttonBrock", # No Data               

########################################
 setwd(paste0(basewd,'/Results'))
 save.image("SkewResNH_M.RData")
 dnhmM <- data.frame(ResNHM)
 colnames(dnhmM) <- colnames(ResNHM)
 write.csv(ResNHM, "SkewResults-Individual-NHM-Male.csv")
 setwd(basewd)














