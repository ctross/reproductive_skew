########################################################################
# Run Theory Simulations
 set.seed(2)

############################################################ Prep arrays
 Q = 30
 K = 30
 Reps = 30
 ResPolyC <- ResPoly <- ResMono <- array(NA,c(Reps,Q,K,3))
 PFP_PolyC <- PFP_Poly <- PFP_Mono <- array(NA,c(Reps,Q,K))
 PMP_PolyC <- PMP_Poly <- PMP_Mono <- array(NA,c(Reps,Q,K))

 N <- 100
 Mu <- seq(0.15, 0.95,length.out=Q)
 Gamma <- 1-Mu

 MuRival <- 10
 BRival <- rev(exp(seq(-3.4, 0.5,length.out=K)))

 MuNonRival <- 18
 BNonRival <- exp(0.5)

 const <- 1

########################################################################
####################################################### Begin Simulation
 for(i in 1:Q){       # Loop over values of Mu
 for(k in 1:K){  
 for(reps in 1:Reps){ # Loop over random values of resources

  Rival <- rgamma(N, MuRival*BRival[k],BRival[k])+const
  NonRival <- runif(N, 0.991, 0.992) #rgamma(N, MuNonRival*BNonRival,BNonRival)+const

######################################################## Set Parameters
  gamma <- Gamma[i]         # Non-Rival Elasticity
  mu    <- Mu[i]            # Rival Elasticity

  nm <- N                   # Number of Males in Population
  nf <- N                   # Number of Females in Population

  g <- NonRival             # Vector of Non-Rival Wealth
  m <- Rival                # Vector of Rival Wealth
  
  c <- m^0.6                # Mating Costs

#######################################################################
# Open storage spaces
  supply_all <- matrix(0, nrow=nm, ncol=1)
  demand_all <- matrix(0, nrow=nm, ncol=1)
  fit_all    <- matrix(0, nrow=nm, ncol=1)
  PredWives  <- matrix(0, nrow=nm, ncol=1)

#######################################################################
# Begin Model
####################################################### Male Demand

# First Calculate floor and ceiling
  demand_allF <- floor(m*(1-mu)/c)
  demand_allC <- ceiling(m*(1-mu)/c)

# Then assign either floor or ceiling value, depending on which maximizes fitness
  demand_all <- ifelse(
  ifelse(m>=(demand_allC*c),g^gamma *(m-(demand_allC*c))^mu * demand_allC^(1-mu),0) > ifelse(m>=(demand_allF*c),g^gamma *(m-(demand_allF*c))^mu * demand_allF^(1-mu),0),
  ceiling(m*(1-mu)/c),
  floor(m*(1-mu)/c))

######################################################### Female Supply
# Open storage of fitness values
  female_fitness <- matrix(0,nrow=nm,ncol=(nf+1))

# Define female fitness for each male, under all possible numbers of wives he might have
  for(n in 1:nf){
    female_fitness[,n] <- (g^gamma) * ((ifelse(((m-(n*c))/n)<0,0,((m-(n*c))/n)))^mu)
                }
    female_fitness[is.na(    female_fitness )] <- 0

# Open storage of supply values
     supply <- matrix(0,nrow=nm,ncol=2)

# Now make mating pairs to define female supply
 for(f in 1:nf){                         # For each woman
    female_choice <- female_fitness[,1] # Set her options to the updated fitness list
  # Now check if there are males who still desire wives, and possible wives who desire males.
    if(sum(is.na(female_choice[which(supply[,1]<demand_all)]))==length(female_choice[which(supply[,1]<demand_all)])){
      Y <- 0  # If the above is met, it means that no more women can be paired, so set Y (fitness) to zero
      } else{
  # Find which male yields greatest fitness
     Y <- max(female_choice[which(supply[,1]<demand_all)], na.rm=T);
     I <- which(female_choice==max(female_choice[which(supply[,1]<demand_all)], na.rm=T))
     noise <- rep(length(I),0)
     noise[1] <- -0.1
     I <- ifelse(length(I)>1, I[which((supply[I,1]+noise)==min(supply[I,1]))], I)
            }
   # Now check if Y is greater than zero, if so update the number of wives held by the guy, I, to who the woman was paired
   if (Y>0){
    supply[I,1] <- supply[I,1]+1;
    supply[I,2] <- Y;
           }
   # Finally, update the first column of female fitness to reflect the new distribution of wives
    female_fitness[I, 1] <- female_fitness[I,supply[I,1]+1 ]    #Note that the +1 is needed as a shift
      }

# Collect Data
# Female Supply
    supply_all <- supply[,1];

# Define Predicted Number of Wives
    fit_all <- supply[,2];
     for(j in 1:nm){
      PredWives[j] <- min(supply_all[j], demand_all[j])
      }

##################################################################### Get M Poly IFD
###### For males it is easy
   Male_M <- M_index(PredWives*ifelse(PredWives==0, 0, g^gamma + ((m-PredWives*c)/PredWives)^mu ), rep(45,N))
   
###### For females
  GG <- cbind(PredWives, ifelse(PredWives==0, 0, g^gamma + ((m-PredWives*c)/PredWives)^mu))
   
  fitFem <- c()
   for(j in 1:N){
      if(GG[j,1]>0)
      fitFem <- c(fitFem, rep(GG[j,2], GG[j,1]))
      }

   Female_M <- M_index(fitFem, rep(45,N))
   
   ResPoly[reps,i,k,] <- c(Male_M, Female_M, Male_M-Female_M)
   PFP_Poly[reps,i,k] <- sum(PredWives[which(PredWives>1)])/length(PredWives)
   PMP_Poly[reps,i,k] <- length(PredWives[which(PredWives>1)])/length(PredWives[which(PredWives>0)])
   
##################################################################### Get M Poly Coersion
###### For males its easy
  PredWivesC <- PredWives
  takers <- round(length(which(PredWives==1))*0.15)
  scrapmat <- cbind(m,1:N,PredWives)
  scrapmat <- scrapmat[order(scrapmat[,1],decreasing=TRUE),]
  scrapmat <- scrapmat[which(scrapmat[,3]>0),]

  winners <- c(scrapmat[,2])[1:takers]
  losers <- rev(scrapmat[,2])[1:takers]

  PredWivesC[winners] <- PredWives[winners] + rmultinom(1, sum(PredWives[losers]), ((scrapmat[1:takers,1]-PredWives[winners]*c[winners])/PredWives[winners])^mu)
  PredWivesC[losers] <- rep(0,length(losers))
  Male_M <- M_index(PredWivesC*ifelse(PredWivesC==0 | (m-PredWivesC*c)<0, 0, g^gamma + ((m-PredWivesC*c)/PredWivesC)^mu), rep(45,N))
   
###### For females
  GG <- cbind(PredWivesC, ifelse(PredWivesC==0 | (m-PredWivesC*c)<0, 0, g^gamma + ((m-PredWivesC*c)/PredWivesC)^mu))
   
   fitFem <- c()
   for( j in 1:N){
      if(GG[j,1]>0)
      fitFem <- c(fitFem, rep(GG[j,2],GG[j,1]))
   }

   Female_M <- M_index(fitFem,rep(45,N))
   
   ResPolyC[reps,i,k,] <- c(Male_M, Female_M, Male_M-Female_M)
   PFP_PolyC[reps,i,k] <- sum(PredWivesC[which(PredWivesC>1)])/length(PredWivesC)
   PMP_PolyC[reps,i,k] <- length(PredWivesC[which(PredWivesC>1)])/length(PredWivesC[which(PredWivesC>0)])
   
##################################################################### Get M Mono
###### For males its easy
   Male_M <- M_index(rep(1,N)*ifelse(rep(1,N)==0, 0, g^gamma + ((m-rep(1,N)*c)/rep(1,N))^mu),
                     rep(45,N))
   
###### For females
  GG <- cbind(rep(1,N),ifelse(rep(1,N)==0,0,g^gamma + ((m-rep(1,N)*c)/rep(1,N))^mu))
   
   fitFem <- c()
   for( j in 1:N){
      if(GG[j,1]>0)
      fitFem <- c(fitFem, rep(GG[j,2],GG[j,1]))
   }
   Female_M <- M_index(fitFem,rep(45,N))
   
   ResMono[reps,i,k,] <- c(Male_M, Female_M, Male_M-Female_M)
   PFP_Mono[reps,i,k] <- 0
   PMP_Mono[reps,i,k] <- 0
 } 
 print(paste("Mu",i))
 print(paste("M",k))
 } 
}

####################################################### Process Results  
DiffResPolyResPolyC <- ResPoly-ResPolyC    
DiffResPolyResMono  <- ResPoly-ResMono
DiffResPolyCResMono <- ResPolyC-ResMono  

ResPolyEsts  <- array(NA,c(3,Q,K,3))
ResPolyCEsts <- array(NA,c(3,Q,K,3))
ResMonoEsts  <- array(NA,c(3,Q,K,3))

DiffResPolyResPolyCEsts <- array(NA,c(3,Q,K,3)) 
DiffResPolyResMonoEsts  <- array(NA,c(3,Q,K,3))  
DiffResPolyCResMonoEsts <- array(NA,c(3,Q,K,3)) 

for( k in 1:K){
for( i in 1:Q){
for( j in 1:3){
ResPolyEsts[1,i,k,j]  <- mean(ResPoly[,i,k,j])
ResPolyCEsts[1,i,k,j] <- mean(ResPolyC[,i,k,j])
ResMonoEsts[1,i,k,j]  <- mean(ResMono[,i,k,j])

DiffResPolyResPolyCEsts[1,i,k,j]  <- mean(DiffResPolyResPolyCEsts[,i,k,j])
DiffResPolyResMonoEsts[1,i,k,j]   <- mean(DiffResPolyResMonoEsts[,i,k,j])
DiffResPolyCResMonoEsts[1,i,k,j]  <- mean(DiffResPolyCResMonoEsts[,i,k,j])

ResPolyEsts[2,i,k,j]  <- HPDI(ResPoly[,i,k,j])[1]
ResPolyCEsts[2,i,k,j] <- HPDI(ResPolyC[,i,k,j])[1]
ResMonoEsts[2,i,k,j]  <- HPDI(ResMono[,i,k,j])[1]

DiffResPolyResPolyCEsts[2,i,k,j]  <- HPDI(DiffResPolyResPolyC[,i,k,j])[1]
DiffResPolyResMonoEsts[2,i,k,j]   <- HPDI(DiffResPolyResMono[,i,k,j])[1]
DiffResPolyCResMonoEsts[2,i,k,j]  <- HPDI(DiffResPolyCResMono[,i,k,j])[1]

ResPolyEsts[3,i,k,j]  <- HPDI(ResPoly[,i,k,j])[2]
ResPolyCEsts[3,i,k,j] <- HPDI(ResPolyC[,i,k,j])[2]
ResMonoEsts[3,i,k,j]  <- HPDI(ResMono[,i,k,j])[2]

DiffResPolyResPolyCEsts[3,i,k,j]  <- HPDI(DiffResPolyResPolyC[,i,k,j])[2]
DiffResPolyResMonoEsts[3,i,k,j]   <- HPDI(DiffResPolyResMono[,i,k,j])[2]
DiffResPolyCResMonoEsts[3,i,k,j]  <- HPDI(DiffResPolyCResMono[,i,k,j])[2]
}}}

RivalGini <- array(NA,c(Q,K))
RivalImportance <- array(NA,c(Q,K))

for(i in 1:Q){       
 RivalImportance[i,] <- rep(Mu[i],K)          
}

for(k in 1:K){  
 RivalGini[,k] <- rep(Gini_index(rgamma(10000, MuRival*BRival[k],BRival[k])+const),Q)
}

PFP_PolyEsts  <- array(NA,c(Q,K))
PFP_PolyCEsts <- array(NA,c(Q,K))
PFP_MonoEsts  <- array(NA,c(Q,K))

for( k in 1:K){
for( i in 1:Q){
PFP_PolyEsts[i,k]  <- mean(PFP_Poly[,i,k])
PFP_PolyCEsts[i,k] <- mean(PFP_PolyC[,i,k])
PFP_MonoEsts[i,k]  <- mean(PFP_Mono[,i,k])
}}

PMP_PolyEsts  <- array(NA,c(Q,K))
PMP_PolyCEsts <- array(NA,c(Q,K))
PMP_MonoEsts  <- array(NA,c(Q,K))

for( k in 1:K){
for( i in 1:Q){
PMP_PolyEsts[i,k]  <- mean(PMP_Poly[,i,k])
PMP_PolyCEsts[i,k] <- mean(PMP_PolyC[,i,k])
PMP_MonoEsts[i,k]  <- mean(PMP_Mono[,i,k])
}}


#################################### Time for ggplot
RivalGini <- round(RivalGini,2) 

datM <- data.frame( Mean=c( c(ResPolyEsts[1,,,1]), c(ResPolyCEsts[1,,,1]), c(ResMonoEsts[1,,,1]), c(ResMonoEsts[1,,,1]) -c(ResPolyEsts[1,,,1])),
                    Low=c( c(ResPolyEsts[2,,,1]), c(ResPolyCEsts[2,,,1]), c(ResMonoEsts[2,,,1]),  c(ResMonoEsts[2,,,1]) - c(ResPolyEsts[2,,,1])),
                    High=c( c(ResPolyEsts[3,,,1]), c(ResPolyCEsts[3,,,1]), c(ResMonoEsts[3,,,1]), c(ResMonoEsts[3,,,1]) - c(ResPolyEsts[3,,,1])),
                    Mating=c(rep("IFD", Q*K),rep("Coerce", Q*K),rep("Monog", Q*K),rep("Difference", Q*K)),
                    RivalImportance=rep(c(RivalImportance),4),
                    RivalGini=rep(c(RivalGini),4),
                    Skew=rep("Male", 4*Q*K),
                    PFP=c(PFP_PolyEsts,PFP_PolyCEsts,PFP_MonoEsts,PFP_PolyEsts)
                    )

datF <- data.frame( Mean=c( c(ResPolyEsts[1,,,2]), c(ResPolyCEsts[1,,,2]), c(ResMonoEsts[1,,,2]), c(ResMonoEsts[1,,,2]) -c(ResPolyEsts[1,,,2])),
                    Low=c( c(ResPolyEsts[2,,,2]), c(ResPolyCEsts[2,,,2]), c(ResMonoEsts[2,,,2]), c(ResMonoEsts[2,,,2]) -c(ResPolyEsts[2,,,2])),
                    High=c( c(ResPolyEsts[3,,,2]), c(ResPolyCEsts[3,,,2]), c(ResMonoEsts[3,,,2]), c(ResMonoEsts[3,,,2]) -c(ResPolyEsts[3,,,2])),
                    Mating=c(rep("IFD", Q*K),rep("Coerce", Q*K),rep("Monog", Q*K),rep("Difference", Q*K)),
                    RivalImportance=rep(c(RivalImportance),4),
                    RivalGini=rep(c(RivalGini),4),
                    Skew=rep("Female", 4*Q*K),
                    PFP=c(PFP_PolyEsts,PFP_PolyCEsts,PFP_MonoEsts,PFP_PolyEsts)
                    )

datD <- data.frame( Mean=c( c(ResPolyEsts[1,,,3]), c(ResPolyCEsts[1,,,3]), c(ResMonoEsts[1,,,3]), c(ResMonoEsts[1,,,3]) -c(ResPolyEsts[1,,,3])),
                    Low=c( c(ResPolyEsts[2,,,3]), c(ResPolyCEsts[2,,,3]), c(ResMonoEsts[2,,,3]), c(ResMonoEsts[2,,,3]) -c(ResPolyEsts[2,,,3])),
                    High=c( c(ResPolyEsts[3,,,3]), c(ResPolyCEsts[3,,,3]), c(ResMonoEsts[3,,,3]), c(ResMonoEsts[3,,,3]) -c(ResPolyEsts[3,,,3])),
                    Mating=c(rep("IFD", Q*K),rep("Coerce", Q*K),rep("Monog", Q*K),rep("Difference", Q*K)),
                    RivalImportance=rep(c(RivalImportance),4),
                    RivalGini=rep(c(RivalGini),4),
                    Skew=rep("Diff", 4*Q*K),
                    PFP=c(PFP_PolyEsts,PFP_PolyCEsts,PFP_MonoEsts,PFP_PolyEsts)
                    )


datPFP <- data.frame( Mating=c(rep("IFD", Q*K),rep("Coerce", Q*K),rep("Monog", Q*K)),
                      RivalImportance=rep(c(RivalImportance),3),
                      RivalGini=rep(c(RivalGini),3),
                      Skew=rep("Percent female polygyny", 3*Q*K),
                      PFP=c(PFP_PolyEsts,PFP_PolyCEsts,PFP_MonoEsts)
                      )

datPMP <- data.frame( Mating=c(rep("IFD", Q*K),rep("Coerce", Q*K),rep("Monog", Q*K)),
                      RivalImportance=rep(c(RivalImportance),3),
                      RivalGini=rep(c(RivalGini),3),
                      Skew=rep("Percent male polygyny", 3*Q*K),
                      PFP=c(PMP_PolyEsts,PMP_PolyCEsts,PMP_MonoEsts)
                      )


                  
dat <- rbind(datM,datF,datD)
datP <- rbind(datPFP,datPMP)

dat$RivalGini <- factor(dat$RivalGini)
dat$RivalImportance <- factor(round(dat$RivalImportance,2))

datP$RivalGini <- factor(datP$RivalGini)
datP$RivalImportance <- factor(round(datP$RivalImportance,2))

dat$Mating <- factor(dat$Mating)
dat$Mating <- factor(dat$Mating, levels(dat$Mating)[c(3,1,4,2)])

datP$Mating <- factor(datP$Mating)
datP$Mating <- factor(datP$Mating, levels(datP$Mating)[c(3,1,4,2)])

dat$Skew <- factor(dat$Skew)
dat$Skew <- factor(dat$Skew, levels(dat$Skew)[c(3,2,1)])

datP$Skew <- factor(datP$Skew)
datP$Skew <- factor(datP$Skew, levels(datP$Skew)[c(3,2,1)])

levels(dat$Skew) = c("Male", "Female", "Sex difference") 

levels(datP$Mating) = c("Ideal-free","Coerce","Socially-imposed monogamy", "Difference (SIM vs. IFD)")
levels(dat$Mating) = c("Ideal-free","Coerce","Socially-imposed monogamy", "Difference (SIM vs. IFD)")

pal <- wes_palette("Zissou1", 100, type = "continuous") 
  

dat2female = dat[which(dat$Mating == "Difference (SIM vs. IFD)" & dat$Skew=="Female"),]


p3b1 <- ggplot(data = dat2female, mapping = aes(y = RivalImportance, x = RivalGini, fill = Mean, z=PFP)) +
  geom_raster() + facet_grid(Skew ~ Mating, scales="free_y") +
  scale_fill_gradientn(colours = pal) + labs(x="Male rival resource Gini", y="Rival resource importance")+
  scale_y_discrete(expand=c(0,0),
    breaks=levels(dat$RivalImportance)[c(TRUE, rep(FALSE, 4))]) +
  scale_x_discrete(expand=c(0,0),
    breaks=levels(dat$RivalGini)[c(TRUE, rep(FALSE, 4))]) +
  theme_grey(base_size=16) + labs(fill = "Skew") + theme(legend.position="bottom", legend.key.width= unit(1.75, 'cm')) + theme(strip.text = element_text(size=16))


dat2male = dat[which(dat$Mating == "Difference (SIM vs. IFD)" & dat$Skew=="Male"),]


p3b2 <- ggplot(data = dat2male, mapping = aes(y = RivalImportance, x = RivalGini, fill = Mean, z=PFP)) +
  geom_raster() + facet_grid(Skew ~ Mating, scales="free_y") +
  scale_fill_gradientn(colours = pal) + labs(x="Male rival resource Gini", y="Rival resource importance")+
  scale_y_discrete(expand=c(0,0),
    breaks=levels(dat$RivalImportance)[c(TRUE, rep(FALSE, 4))]) +
  scale_x_discrete(expand=c(0,0),
    breaks=levels(dat$RivalGini)[c(TRUE, rep(FALSE, 4))]) +
  theme_grey(base_size=16) + labs(fill = "Skew") + theme(legend.position="bottom", legend.key.width= unit(1.75, 'cm')) + theme(strip.text = element_text(size=16))



dat2diff = dat[which(dat$Mating == "Difference (SIM vs. IFD)" & dat$Skew=="Sex difference"),]


p3b3 <- ggplot(data = dat2diff, mapping = aes(y = RivalImportance, x = RivalGini, fill = Mean, z=PFP)) +
  geom_raster() + facet_grid(Skew ~ Mating, scales="free_y") +
  scale_fill_gradientn(colours = pal) + labs(x="Male rival resource Gini", y="Rival resource importance")+
  scale_y_discrete(expand=c(0,0),
    breaks=levels(dat$RivalImportance)[c(TRUE, rep(FALSE, 4))]) +
  scale_x_discrete(expand=c(0,0),
    breaks=levels(dat$RivalGini)[c(TRUE, rep(FALSE, 4))]) +
  theme_grey(base_size=16) + labs(fill = "Skew") + theme(legend.position="bottom", legend.key.width= unit(1.75, 'cm')) + theme(strip.text = element_text(size=16))



setwd(paste0(basewd,'/Results'))
ggsave("SkewSmall_F.PDF",p3b1,height=8, width=9)
ggsave("SkewSmall_M.PDF",p3b2,height=8, width=9)
ggsave("SkewSmall_D.PDF",p3b3,height=8, width=9)

setwd(basewd)
  



