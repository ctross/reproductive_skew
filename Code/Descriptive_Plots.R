#####################################################################################################
 d = read.csv("Results/SkewResults-PrunedDataSet.csv")
 pal = wes_palette("Zissou1", 100, type = "continuous") 

####################################### Data Prep All
M_m = d$M_sqrt
M_f = d$F_sqrt
Human = d$Human
Monogamous = d$Monogamous
S = d$Species2

M_m_short = aggregate(M_m ~ S, FUN=mean)
M_f_short = aggregate(M_f ~ S, FUN=mean)

Human_short = aggregate(Human ~ S, FUN=mean)
Monogamous_short = aggregate(Monogamous ~ S, FUN=mean)

skew_vals = merge(M_m_short, M_f_short, by="S")
cov_vals = merge(Human_short, Monogamous_short, by="S")

d_s = merge(skew_vals, cov_vals, by="S")

d_s$Monogamous[which(d_s$Human==1)] = 2
colnames(d_s) = c("S", "M_sqrt", "F_sqrt", "Human", "Monogamous")

set.seed(1)
randy = rbinom(length(d_s$Monogamous), 1, 0.5)

d_s$Species_Names_Cut = ifelse(d_s$Monogamous==1, d_s$S, ifelse(randy==1, d_s$S, NA))
d_s$Species_Names_Cut[which(d_s$Human==1)] = "Homo_sapiens"

d_s$Species = us_to_space(d_s$Species_Names_Cut)

####################################### Data Prep Human
df_h = d[which(d$Human==1),]

M_plot = ggplot(d_s, aes(x= M_sqrt, y = F_sqrt, shape=factor(Monogamous), label = Species, fill = factor(Monogamous), segment.color = factor(Monogamous), color=factor(Monogamous))) + 
  geom_point( size = 2) +
  geom_point( data=df_h, size = 1.5, color=pal[77]) +
  geom_abline(intercept = 0, slope = 1, size=1, linetype="dashed") +
   geom_text_repel(
    point.padding = NA,
    box.padding = 0.1,
    data          = subset(d_s, F_sqrt > 0 & Human == 0),
    nudge_x       = -0.5 + subset(d_s, F_sqrt > 0 & Human == 0)$M_sqrt^(0.5),
    nudge_y       = 0.0 + subset(d_s, F_sqrt > 0 & Human == 0)$F_sqrt^(0.5),
    segment.size  = 0.5,
    direction     = "y",
    hjust         = 0,
    force = 10
  ) +
  geom_text_repel(
    point.padding = NA,
    box.padding = 0.1,
    data          = subset(d_s, F_sqrt < 0 & Human == 0),
    nudge_x       = 0.1 + subset(d_s, F_sqrt < 0 & Human == 0)$M_sqrt,
    nudge_y       = -0.5 + subset(d_s, F_sqrt < 0 & Human == 0)$F_sqrt,
    segment.size  = 0.5,
    direction     = "y",
    hjust         = 0,
    force = 10
  ) +
  geom_text_repel(
    point.padding = NA,
    box.padding = 0.1,
    data          = subset(d_s, Human > 0),
    nudge_x       = -2.4 + subset(d_s, Human > 0)$M_sqrt,
    nudge_y       = 0.6 + subset(d_s, Human > 0)$F_sqrt,
    segment.size  = 0.5,
    direction     = "y",
    hjust         = 0,
    force = 10
  ) +
  scale_fill_manual(
    name = "Monogamous",
    values = c(pal[100], pal[1], pal[77]),
    # The same color scall will apply to both of these aesthetics.
    aesthetics = c("fill", "segment.color")
  ) + 
    scale_color_manual(
    values = c(pal[100], pal[1], pal[77])
  ) +
   geom_rect(aes(xmin = 0, xmax = 1.35, ymin =0, ymax = 1.35), 
            fill = NA,  color = pal[77]) +
  guides(fill = guide_legend(override.aes = aes(color = NA))) + coord_cartesian(xlim = c(-1.5, 5), ylim = c(-1.5, 5)) + theme(legend.position = "none") + 
  labs(x="Male reproductive skew", y="Female reproductive skew") + theme(axis.title = element_text(size = 16))

  M_plot

 ####################
 setwd(paste0(basewd,'/Results'))
 ggsave("mammal_scatter.pdf",M_plot,height=7,width=7)
 setwd(basewd)



#####################################################################################################
####################################### Human plot
H_plot = ggplot(df_h, aes(x= M_sqrt, y = F_sqrt, shape=factor(Monogamous), label = Population, fill =factor(Monogamous), segment.color = factor(Monogamous), color=factor(Monogamous))) + 
  geom_point( size = 2) +
  geom_abline(intercept = 0, slope = 1, size=1, linetype="dashed")  +
  geom_text_repel()+
  scale_color_manual(
    values = c(pal[100], pal[1])
  )+
  guides(fill = guide_legend(override.aes = aes(color = NA))) + coord_cartesian(xlim = c(0.2, 1.4), ylim = c(0.2, 1.4)) + theme(legend.position = "none") +
  labs(x="Male reproductive skew", y="Female reproductive skew") + theme(axis.title = element_text(size = 16))
  
  H_plot

 ####################
 setwd(paste0(basewd,'/Results'))
 ggsave("human_scatter.pdf",H_plot,height=7,width=7)
 setwd(basewd)







#####################################################################################################
####################################### Subsistence plot

  boxy_M = data.frame(Outcome = df_h$M_sqrt, Subsistence = df_h$Subsistence, Measure = "Male skew", PolygynyCode=df_h$PolygynyCode)
  boxy_F = data.frame(Outcome = df_h$F_sqrt, Subsistence = df_h$Subsistence, Measure = "Female skew", PolygynyCode=df_h$PolygynyCode)
  boxy_D = data.frame(Outcome = df_h$D_sqrt, Subsistence = df_h$Subsistence, Measure = "Sex difference in skew", PolygynyCode=df_h$PolygynyCode)

  boxy_df = rbind(boxy_M, boxy_F, boxy_D)

  boxy_df$Subsistence = factor(boxy_df$Subsistence)
  levels(boxy_df$Subsistence) = c("Agriculture", "(Agro)pastoralism", "Foraging", "Horticulture", "Market")
  boxy_df$Subsistence = factor(boxy_df$Subsistence, levels=c("Foraging", "Horticulture", "(Agro)pastoralism", "Agriculture", "Market"))

  boxy_df$Measure = factor(boxy_df$Measure)
  boxy_df$Measure = factor(boxy_df$Measure, levels=c("Male skew", "Female skew", "Sex difference in skew"))



  boxy_plot = ggplot(boxy_df, aes(x=factor(Subsistence), y=Outcome) ) + 
  geom_jitter(position=position_jitter(width=0.2, height=0.01), aes(colour=factor(Subsistence)), alpha=0.9) +
  geom_boxplot(alpha = 0.5, show.legend = FALSE, aes(fill=factor(Subsistence)), outlier.shape = NA) + facet_grid(. ~ Measure) +
  theme(strip.text.x = element_text(size=14, color="black")) +  scale_fill_manual(values = wes_palette("Zissou1")) + scale_color_manual(values = wes_palette("Zissou1")) +
  labs(x="", y="") + 
  theme(axis.title = element_text(size = 16)) + theme(legend.position = "none") +
  theme(axis.text = element_text(size=12))

  boxy_plot

  setwd(paste0(basewd,'/Results'))
  ggsave("subsistence_plot.pdf",boxy_plot,height=6,width=20)
  setwd(basewd)
  

#####################################################################################################
####################################### Mating plot
  boxy_df$NewPolyCode = ifelse(boxy_df$PolygynyCode == "C", "Polygyny \nCommon", ifelse(boxy_df$PolygynyCode =="B", "Polygyny \nPermitted", "Monogamy \nImposed"))
  boxy_df$NewPolyCode = factor(boxy_df$NewPolyCode)
  boxy_df$NewPolyCode = factor(boxy_df$NewPolyCode, levels=c("Monogamy \nImposed", "Polygyny \nPermitted", "Polygyny \nCommon"))

   boxy_plot2 = ggplot(boxy_df, aes(x=factor(NewPolyCode), y=Outcome) ) + 
  geom_jitter(position=position_jitter(width=0.2, height=0.01), aes(colour=factor(NewPolyCode)), alpha=0.9) +
  geom_boxplot(alpha = 0.5, show.legend = FALSE, aes(fill=factor(NewPolyCode)), outlier.shape = NA) + facet_grid(. ~ Measure) +
  theme(strip.text.x = element_text(size=14, color="black")) +    
  scale_color_manual(
    values = c(pal[1], pal[75], pal[100])
  ) + 
  scale_fill_manual(
    values = c(pal[1], pal[75], pal[100])
  ) +
  labs(x="", y="") + 
  theme(axis.title = element_text(size = 16)) + theme(legend.position = "none") +
  theme(axis.text = element_text(size=12))

  boxy_plot2

  setwd(paste0(basewd,'/Results'))
  ggsave("mating_system_plot.pdf",boxy_plot2,height=6,width=18)
  setwd(basewd)
 

 xtable(table(df_h$Subsistence, df_h$PolygynyCode))
 