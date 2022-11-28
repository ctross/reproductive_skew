#################################################################### Individual-level human data
dM <- read.csv(paste0(basewd,"/Results/SkewResults-Individual-Human-Male.csv"))
dF <- read.csv(paste0(basewd,"/Results/SkewResults-Individual-Human-Female.csv"))
dC <- read.csv(paste0(basewd,"/Data/Population-Level Data Sets for Meta-Analysis/SkewResults-Covariates.csv"))

dHuman <- cbind(dC,dM,dF)
dHuman$Species <- "Homo sapiens"

dH <- dHuman[,c("Species","Population","Ethnographer","Location","Subsistence","Human","Robustness","PolygynyCode","N0","M_Posterior_Estimate","M_Posterior_EstimateSD",
    "N0_fem","M_Posterior_Estimate_fem","M_Posterior_EstimateSD_fem", "M_index", "M_index_fem")]
dH$DataFrom <- "IndHuman"

#################################################################### Individual-level non-human data
nhM <- read.csv(paste0(basewd,"/Results/SkewResults-Individual-NHM-Male.csv"))
nhF <- read.csv(paste0(basewd,"/Results/SkewResults-Individual-NHM-Female.csv"))
nhC <- read.csv(paste0(basewd,"/Data/Population-Level Data Sets for Meta-Analysis/SkewResults-NHM-Covariates.csv"))

dNonHuman <- cbind(nhC,nhM,nhF)

dNH <- dNonHuman[,c("Species","Population","Ethnographer","Location","MatingSystem", "Monogamous", "Human", "NonHumanPrimate","N0","M_Posterior_Estimate","M_Posterior_EstimateSD",
    "N0_fem","M_Posterior_Estimate_fem","M_Posterior_EstimateSD_fem", "M_index", "M_index_fem")]

dH$NonHumanPrimate <- 0
dH$MatingSystem <- NA
dH$Monogamous <- ifelse(dH$PolygynyCode=="C",0,1)

dNH$Production.System <- NA
dNH$Robustness <- 1
dNH$PolygynyCode <- NA

dNH$DataFrom <- "IndNonHuman"

dNH$Subsistence = dNH$Production.System

dH <- dH[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate", 
 "M_Posterior_EstimateSD", "N0_fem", "M_Posterior_Estimate_fem", 
 "M_Posterior_EstimateSD_fem", "DataFrom", "M_index", "M_index_fem")]

dNH <- dNH[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate", 
 "M_Posterior_EstimateSD", "N0_fem", "M_Posterior_Estimate_fem", 
 "M_Posterior_EstimateSD_fem","DataFrom", "M_index", "M_index_fem")]


#################################################################### Population-level non-human paired data
dM <- read.csv(paste0(basewd,"/Results/SkewResults-Published-NHM-Paired-Male.csv"))
dF <- read.csv(paste0(basewd,"/Results/SkewResults-Published-NHM-Paired-Female.csv"))

dM$M_Posterior_EstimateSD <- NA
dM$Ethnographer <- NA
dM$Location <- NA
dM$Production.System <- NA
dM$Robustness <- 1
dM$PolygynyCode <- NA
dM$M_index <- NA
dM$M_index_fem <- NA

dM$Subsistence = dM$Production.System

dM <- dM[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate","M_Posterior_EstimateSD","M_index", "M_index_fem")]


dF$M_Posterior_EstimateSD_fem <- NA



dNH2 <- cbind(dM,dF[,c("N0_fem", "M_Posterior_Estimate_fem", "M_Posterior_EstimateSD_fem")])

dNH2$DataFrom <- "PubNonHuman"


#################################################################### Population-level non-human unpaired data
################################# Males
dM <- read.csv(paste0(basewd,"/Results/SkewResults-Published-NHM-Unpaired-Male.csv"))
dM$M_Posterior_EstimateSD <- NA
dM$Ethnographer <- NA
dM$Location <- NA
dM$Production.System <- NA
dM$Robustness <- 1
dM$PolygynyCode <- NA
dM$M_index <- NA
dM$M_index_fem <- NA

dM$DataFrom <-ifelse(is.na(dM$B),"PubNonHuman-B","PubNonHuman-I")

dM$Subsistence = dM$Production.System

dM <- dM[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate","M_Posterior_EstimateSD","DataFrom","M_index", "M_index_fem")]

dM$N0_fem <- NA
dM$M_Posterior_Estimate_fem <- NA
dM$M_Posterior_EstimateSD_fem <- NA


dM <- dM[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate", 
 "M_Posterior_EstimateSD", "N0_fem", "M_Posterior_Estimate_fem", 
 "M_Posterior_EstimateSD_fem","DataFrom","M_index", "M_index_fem")]

dNH3m <- dM

############################# Females
dF <- read.csv(paste0(basewd,"/Results/SkewResults-Published-NHM-Unpaired-Female.csv"))
dF$M_Posterior_EstimateSD_fem <- NA
dF$Ethnographer <- NA
dF$Location <- NA
dF$Production.System <- NA
dF$Robustness <- 1
dF$PolygynyCode <- NA
dF$M_index <- NA
dF$M_index_fem <- NA

dF$N0 <- NA
dF$M_Posterior_Estimate <- NA
dF$M_Posterior_EstimateSD <- NA

dF$DataFrom <-ifelse(is.na(dF$B),"PubNonHuman-B","PubNonHuman-I")

dF$Subsistence = dF$Production.System

dF <- dF[, c("Species","Population", "Ethnographer", "Location", "Subsistence", 
 "Human", "Robustness", "PolygynyCode", "NonHumanPrimate", "MatingSystem", 
 "Monogamous","N0", "M_Posterior_Estimate", 
 "M_Posterior_EstimateSD", "N0_fem", "M_Posterior_Estimate_fem", 
 "M_Posterior_EstimateSD_fem","DataFrom","M_index", "M_index_fem")]

dNH3f <- dF




################################################################# Merge
d <- rbind(dNH, dNH2, dNH3m, dNH3f, dH)

d$Subsistence <- factor(d$Subsistence)

d$Subsistence[which(d$Subsistence=="Agricultural")] <- "Agriculture"
d$Subsistence[which(d$Subsistence=="Agropastoral")] <- "Agropastoralism"
d$Subsistence[which(d$Subsistence=="Nomadic")] <-  "Agropastoralism"
d$Subsistence[which(d$Subsistence=="Fishing")] <- "Foraging"
d$Subsistence[which(d$Subsistence=="Pastoralism")] <- "Agropastoralism"
d$Subsistence[which(d$Subsistence=="Pastoral")] <- "Agropastoralism"
d$Subsistence[which(d$Subsistence=="Peasants")] <- "Agriculture"
d$Subsistence[which(d$Subsistence=="Peasants")] <- "Agriculture"
d$Subsistence[which(d$Subsistence=="Farming")] <- "Agriculture"
d$Subsistence[which(d$Subsistence=="Ranching")] <-  "Agropastoralism"
                          
d$Subsistence <- factor(d$Subsistence)                              

 setwd(paste0(basewd,'/Results'))
 write.csv(d,"SkewResults-FullDataSet.csv")
 setwd(basewd)















