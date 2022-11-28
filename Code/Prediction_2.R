################################################################# Prepare Stan Data for P1a
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")
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
  ggsave("p2_plot.pdf", p2_plot, width=7, height=3)
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
  ggsave("p3_plot.pdf", p3_plot, width=7, height=3)
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
  ggsave("p4_plot.pdf", p4_plot, width=7, height=3)
  setwd(basewd)


################################################################# Prepare Stan Data for P2e
df_rsi = read.csv("Data/Additional Data Used in Paper/RSI_polygyny_data.csv")
df_rsi$group="all"

# Fit polynomial regression line and add labels
x = df_rsi$Pct_female_polygyny
y = df_rsi$Diff

formula = y ~ poly(x, 1, raw = TRUE)

plot_cont_d = ggplot(df_rsi, aes(Pct_female_polygyny, Diff)) +
  geom_point(color="grey13") + stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),label.y = 0.6) +
  stat_smooth(aes(fill = group, color = group), method = "lm") +
  stat_regline_equation(label.y = 0.5
  )  + theme(legend.position="none")   +
    scale_fill_manual(
      values = c(pal[9])
     ) +
    scale_color_manual(
      values = c(pal[9])
     ) + labs(y="Sex difference in skew", x="Percent age-adjusted female polygyny") +
     theme(strip.text.x = element_text(size=12,face="bold"), strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))
  plot_cont_d
  setwd(paste0(basewd,'/Results'))
  ggsave("p3b_plot_d.pdf", plot_cont_d, width=5, height=4)
  setwd(basewd)

x = df_rsi$Pct_female_polygyny
y = df_rsi$M_male 

formula = y ~ poly(x, 1, raw = TRUE)

plot_cont_m = ggplot(df_rsi, aes(Pct_female_polygyny, M_male)) +
  geom_point(color="grey13") + stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),label.y = 0.8) +
  stat_smooth(aes(fill = group, color = group), method = "lm") +
  stat_regline_equation(label.y = 0.7
  )  + theme(legend.position="none")   +
    scale_fill_manual(
      values = c(pal[89])
     ) +
    scale_color_manual(
      values = c(pal[89])
     ) + labs(y="Male skew", x="Percent age-adjusted female polygyny") +
     theme(strip.text.x = element_text(size=12,face="bold"), strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))
 plot_cont_m

  setwd(paste0(basewd,'/Results'))
  ggsave("p3b_plot_m.pdf", plot_cont_m, width=5, height=4)
  setwd(basewd)


x = df_rsi$Pct_female_polygyny
y = df_rsi$M_female 

formula = y ~ poly(x, 1, raw = TRUE)

plot_cont_f = ggplot(df_rsi, aes(Pct_female_polygyny, M_female)) +
  geom_point(color="grey13") + stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),label.y = 0.5) +
  stat_smooth(aes(fill = group, color = group), method = "lm") +
  stat_regline_equation(label.y = 0.45
  )  + theme(legend.position="none")   +
    scale_fill_manual(
      values = c(pal[69])
     ) +
    scale_color_manual(
      values = c(pal[69])
     ) + labs(y="Female skew", x="Percent age-adjusted female polygyny") +
     theme(strip.text.x = element_text(size=12,face="bold"), strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))
 plot_cont_f

  setwd(paste0(basewd,'/Results'))
  ggsave("p3b_plot_f.pdf", plot_cont_f, width=5, height=4)
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