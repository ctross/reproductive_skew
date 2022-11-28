################################################################# Prepare Stan Data for P1a
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")
df_pooled = df_pooled[which(df_pooled$Robustness==1),]
pal = wes_palette("Zissou1", 100, type = "continuous") 

mating_sys_h = ifelse(df_pooled$PolygynyCode=="C", 3, ifelse(df_pooled$PolygynyCode=="B", 2, 1))
mating_sys_nhm = ifelse(df_pooled$Human==1, NA, ifelse(df_pooled$Monogamous==0,3,1)) 

model_dat = list(
  M = df_pooled$M_sqrt,
  F = df_pooled$F_sqrt,
  D = df_pooled$D_sqrt,

  N = length(df_pooled$M_sqrt),
  K=3,

  Human = df_pooled$Human,
  Monogamous = rowSums(cbind(mating_sys_h,mating_sys_nhm),na.rm=TRUE)
  )


stan_file_2 = stan_model(file = "Code/Prediction_2.stan")

fit2a = sampling(stan_file_2, data = model_dat, chains=2, iter=3000, control=list(adapt_delta=0.9, max_treedepth=10), refresh=1)

P2_a = summySumA(fit2a,"Base")



P2 = rbind(P2_a)

P2 = P2[-which(P2$Group=="NHM" & P2$System=="Polygyny Permitted"),]

P2$System = factor(P2$System)
levels(P2$System) = c("Normative\nmonogamy", "Normative\npolygyny", "Polygyny rare,\nbut tolerated")

P2$System = factor(P2$System,levels=c("Normative\nmonogamy", "Polygyny rare,\nbut tolerated", "Normative\npolygyny"))

P2$System2 = ifelse(P2$System=="Normative\nmonogamy","Monogamous mammals", "Polygynous mammals")

P2$Effect2 = factor(P2$Effect)
levels(P2$Effect2) = c("Sex difference\nin skew", "Female skew", "Male skew")

################################################################ P2
P2b2 = P2[which(P2$Group=="NHM"),]
p2_plot = ggplot(P2b2,aes(x=Effect2,y=median,ymin=L,ymax=H, group=System2, color=System2))+ 
     geom_linerange(size=1, position = position_dodge(width = 0.5))+
     geom_point(size=2, position = position_dodge(width = 0.5))+
       geom_hline(aes(yintercept=0),color="black",linetype="dashed")+
     labs(y="M*", x="") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + coord_flip() + theme(panel.spacing = unit(1, "lines")) +
      scale_color_manual(
      values = c(pal[1], pal[100])
     ) + theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
   theme(legend.title=element_blank())

 p2_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("p2_plot_Robustness.pdf", p2_plot, width=7, height=3)
  setwd(basewd)


################################################################ P2
P2b = P2[-which(P2$Group=="NHM"),]
p3_plot = ggplot(P2b,aes(x=Effect2,y=median,ymin=L,ymax=H, group=System, color=System))+ 
     geom_linerange(size=1, position = position_dodge(width = 0.5))+
     geom_point(size=2, position = position_dodge(width = 0.5))+
       geom_hline(aes(yintercept=0),color="black",linetype="dashed")+
     labs(y="M*", x="") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + coord_flip() + theme(panel.spacing = unit(1, "lines")) +
      scale_color_manual(
      values = c(pal[1], pal[77], pal[100])
     ) + theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
   theme(legend.title=element_blank())

 p3_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("p3_plot_Robustness.pdf", p3_plot, width=7, height=3)
  setwd(basewd)


################################################################ P3
P2b3 = P2[which(P2$System=="Normative\npolygyny"),]
P2b3$Group[which(P2b3$Group=="NHM")] = "Polygynous non-human mammals"
P2b3$Group[which(P2b3$Group=="Human")] = "Polygynous human groups"

p4_plot = ggplot(P2b3,aes(x=Effect2,y=median,ymin=L,ymax=H, group=Group, color=Group))+ 
     geom_linerange(size=1, position = position_dodge(width = 0.5))+
     geom_point(size=2, position = position_dodge(width = 0.5))+
       geom_hline(aes(yintercept=0),color="black",linetype="dashed")+
     labs(y="M*", x="") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + coord_flip() + theme(panel.spacing = unit(1, "lines")) +
      scale_color_manual(
      values = c("grey10", pal[93])
     ) + theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
   theme(legend.title=element_blank())

 p4_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("p4_plot_Robustness.pdf", p4_plot, width=7, height=3)
  setwd(basewd)



############

results = extract(fit2a, pars="A")$A


#Female human in poly v mono
mean(results[,2,3,2] - results[,2,1,2])
HPDI(results[,2,3,2] - results[,2,1,2],0.9)

#Sex diff human in poly v mono
mean(results[,2,3,3] - results[,2,1,3])
HPDI(results[,2,3,3] - results[,2,1,3],0.9)

#Male poly human vs fem poly nhm
mean(results[,2,3,1] - results[,1,3,1])
HPDI(results[,2,3,1] - results[,1,3,1], 0.89)


#Fem poly human vs fem poly nhm
mean(results[,2,3,2] - results[,1,3,2])
HPDI(results[,2,3,2] - results[,1,3,2], 0.89)

#Fem poly human vs fem poly nhm
mean(results[,2,3,3] - results[,1,3,3])
HPDI(results[,2,3,3] - results[,1,3,3], 0.89)