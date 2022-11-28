################################################################# Prepare Stan Data for P1a
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")

model_dat = list(
  M = df_pooled$M_sqrt,
  F = df_pooled$F_sqrt,
  D = df_pooled$D_sqrt,

  N = length(df_pooled$M),
  K=3,

  Human = df_pooled$Human,
  Monogamous = df_pooled$Monogamous 
  )


stan_file_1 = stan_model(file = "Code/Prediction_1.stan")

fit1a = sampling(stan_file_1, data = model_dat, chains=2, iter=2000, control=list(adapt_delta=0.9, max_treedepth=10), refresh=1)

P1a = summySum(fit1a,"Human vs. NHM")
P1a$Model = "Base"
P1a$Prediction = "Human vs. NHM"


############################################################## P1b
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")
df_pooled = df_pooled[which(df_pooled$Human == 1 | df_pooled$NonHumanPrimate == 1),]

model_dat = list(
  M = df_pooled$M_sqrt,
  F = df_pooled$F_sqrt,
  D = df_pooled$D_sqrt,

  N = length(df_pooled$M),
  K=3,

  Human = df_pooled$Human,
  Monogamous = df_pooled$Monogamous 
  )


stan_file_1 = stan_model(file = "Code/Prediction_1.stan")

fit1b = sampling(stan_file_1, data = model_dat, chains=2, iter=2000, control=list(adapt_delta=0.9, max_treedepth=10), refresh=1)

P1a2 = summySum(fit1b,"Human vs. NHP")
P1a2$Model = "Base"
P1a2$Prediction = "Human vs. NHP"


############################################################# Plot

P1 = rbind(P1a, P1a2)
pal = wes_palette("Zissou1", 100, type = "continuous") 

P1$Effect = factor(P1$Effect)
levels(P1$Effect) = c("Sex difference\nin skew","Female skew","Male skew")
 
P1$Label[which(P1$Label=="Human vs. NHM")] = "Humans vs. non-human mammals"
P1$Label[which(P1$Label=="Human vs. NHP")] = "Humans vs. non-human primates"

p1_plot = ggplot(P1,aes(x=Effect,y=Median,ymin=L,ymax=H, group=Label, color=Label))+ 
     geom_linerange(size=1, position = position_dodge(width = 0.5))+
     geom_point(size=2, position = position_dodge(width = 0.5))+
       geom_hline(aes(yintercept=0),color="black",linetype="dashed")+
     labs(x="", y="Difference in M*") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + coord_flip() + theme(panel.spacing = unit(1, "lines")) +
      scale_color_manual(
      values = c(pal[87], pal[67])
     ) + theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
   theme(legend.title=element_blank())

 p1_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("p1_plot.pdf", p1_plot, width=7.5, height=3)
  setwd(basewd)



