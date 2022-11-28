################################################################################## Match Skew and Phylogenetic data
 d = read.csv("Results/SkewResults-FullDataSet.csv")

 d = d[which(d$DataFrom %in% c("PubNonHuman","IndHuman","IndNonHuman")),]
 d = d[which(!is.na(d$M_Posterior_Estimate) & !is.na(d$M_Posterior_Estimate_fem)),]

 d$Species2 = str_replace(d$Species, " ", "_")

 tree = read.nexus("Data/Additional Data Used in Paper/MammalianTree.nex") 
 tree2 = cophenetic(tree[[1]])

 tree3 = tree2[colnames(tree2) %in% d$Species2, colnames(tree2) %in% d$Species2]

 Distance = tree3/max(tree3)


 N = length(d$Species2)

 d$SpeciesID = NA
 for(i in 1:N){
  d$SpeciesID[i] = which(colnames(Distance)==d$Species2[i])
 }

 J = max(d$SpeciesID)
 S = d$SpeciesID


################################################################### Build data
 Population_With_Duplicates = str_replace_all(d$Population, "[\\[\\]1234567890]", "")
 Population_With_Duplicates[which(Population_With_Duplicates=="Chimpanzee")] = "common chimpanzee"
 d$Population_With_Duplicates = Population_With_Duplicates

 d$M_sqrt = sqrt2(d$M_Posterior_Estimate)
 d$F_sqrt = sqrt2(d$M_Posterior_Estimate_fem)
 d$M = d$M_Posterior_Estimate
 d$F = d$M_Posterior_Estimate_fem
 d$P = factor(Population_With_Duplicates)

 M_reduced = aggregate(d$M_sqrt ~ d$P, FUN=mean)
 F_reduced = aggregate(d$F_sqrt ~ d$P, FUN=mean)

 M_full = aggregate(d$M ~ d$P, FUN=mean)
 F_full = aggregate(d$F ~ d$P, FUN=mean)

 df_pooled_sqrt = merge(M_reduced, F_reduced,  by="d$P")
 df_pooled_full = merge(M_full, F_full, by="d$P")

 df_pooled = merge(df_pooled_sqrt, df_pooled_full, by="d$P")

 colnames(df_pooled) = c("Population", "M_sqrt", "F_sqrt", "M", "F")

 df_pooled$D_sqrt = df_pooled$M_sqrt - df_pooled$F_sqrt
 df_pooled$D = df_pooled$M - df_pooled$F
 
 df_covs = d[!duplicated(d$Population_With_Duplicates), c("Species", "Ethnographer", "Location", "Subsistence", 
                                                           "Human", "Robustness", "PolygynyCode",  "NonHumanPrimate",
                                                           "MatingSystem", "Monogamous", "N0", "N0_fem", "Species2", 
                                                           "SpeciesID", "Population_With_Duplicates")]
 df_covs$Population = df_covs$Population_With_Duplicates

 df_processed = merge(df_pooled, df_covs, by="Population")

 ####################
 setwd(paste0(basewd,'/Results'))
 write.csv(df_processed,"SkewResults-PrunedDataSet.csv")
 write.csv(Distance,"SkewResults-PrunedTree.csv")
 setwd(basewd)


