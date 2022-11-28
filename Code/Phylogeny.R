
tr = phangorn::upgma(tree3)

x_ds = data.frame(d_s$Monogamous, d_s$M_sqrt, d_s$F_sqrt, d_s$M_sqrt - d_s$F_sqrt)
rownames(x_ds) = d_s$S
x_ds = as.matrix(x_ds)
colnames(x_ds) = c("Monogamy","Male, M", "Female, M","Difference, M")

x_ds[which(rownames(x_ds) == "Homo_sapiens"),1] = 1

x_ds[,1] = ifelse(x_ds[,1]*5.6 -1 == -1, 4.6, -1)

phylo.heatmap(tr, x_ds, standardize=FALSE, split=c(0.8,0.2), colors=pal, fsize=c(0.65,0.75,1))


phy_L_m = phylosig(tr, x_ds[,2], method="lambda", test=TRUE)
phy_L_f = phylosig(tr, x_ds[,3], method="lambda", test=TRUE)
phy_L_d = phylosig(tr, x_ds[,4], method="lambda", test=TRUE)

phy_K_m = phylosig(tr, x_ds[,2], method="K", test=TRUE)
phy_K_f = phylosig(tr, x_ds[,3], method="K", test=TRUE)
phy_K_d = phylosig(tr, x_ds[,4], method="K", test=TRUE)

Res_phylo = data.frame(Sex=rep(c("Male M", "Female M"," Sex difference"),2),
                       Metric=rep(c("L","K"),each=3),
                       Value=c(phy_L_m$lambda, phy_L_f$lambda, phy_L_d$lambda,
                               phy_K_m$K, phy_K_f$K, phy_K_d$K
                        ),
                       P=c(phy_L_m$P, phy_L_f$P, phy_L_d$P,
                               phy_K_m$P, phy_K_f$P, phy_K_d$P
                        )
                       )


print(xtable(Res_phylo), include.rownames=FALSE)

setwd(paste0(basewd,'/Results'))
pdf("Phylogeny.pdf", height=8, width=10)
phylo.heatmap(tr, x_ds, standardize=FALSE, split=c(0.8,0.2), colors=pal, fsize=c(0.65,0.75,1))
dev.off()
setwd(basewd)
  