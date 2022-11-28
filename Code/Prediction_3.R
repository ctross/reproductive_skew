################################################################# Prepare Stan Data for P1a
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")

df_pooled = df_pooled[which(df_pooled$Monogamous==0),]

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

fit3a = sampling(stan_file_1, data = model_dat, chains=2, iter=2000, control=list(adapt_delta=0.9, max_treedepth=10), refresh=1)

P3a = summySum(fit3a,"Human vs. NHM")
P3a$Model = "Base"
P3a$Prediction = "Human vs. NHM"


############################################################## P1b
df_pooled = read.csv("Results/SkewResults-PrunedDataSet.csv")

df_pooled = df_pooled[which(df_pooled$Monogamous==0),]
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

fit3b = sampling(stan_file_1, data = model_dat, chains=2, iter=2000, control=list(adapt_delta=0.95, max_treedepth=10), refresh=1)

P3a2 = summySum(fit3b,"Human vs. NHP")
P3a2$Model = "Base"
P3a2$Prediction = "Human vs. NHP"


P3 = rbind(P3a,P3a2)

pal = wes_palette("Zissou1", 100, type = "continuous") 

P3$Effect = factor(P3$Effect)
levels(P3$Effect) = c("Sex difference\nin skew","Female skew","Male skew")
 
P3$Label[which(P3$Label=="Human vs. NHM")] = "Humans vs. non-human mammals"
P3$Label[which(P3$Label=="Human vs. NHP")] = "Humans vs. non-human primates"

p4b_plot = ggplot(P3,aes(x=Effect,y=Median,ymin=L,ymax=H, group=Label, color=Label))+ 
     geom_linerange(size=1, position = position_dodge(width = 0.5))+
     geom_point(size=2, position = position_dodge(width = 0.5))+
       #facet_wrap(vars(SubModel), ncol=1,scales = "free")+
       geom_hline(aes(yintercept=0),color="black",linetype="dashed")+
     labs(y="Regression parameters", x="") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title.y=element_text(size=14,
     face="bold"), axis.title.x=element_blank())+theme(strip.text.y = element_text(angle = 360)) + coord_flip() + theme(panel.spacing = unit(1, "lines")) +
      scale_color_manual(
      values = c(pal[87], pal[67])
     ) + theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
   theme(legend.title=element_blank())

 p4b_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("p4b_plot.pdf", p4b_plot, width=7.5, height=3)
  setwd(basewd)
