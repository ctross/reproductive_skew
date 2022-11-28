
####################################################### Male
dHuman$Rank = rank(dHuman$M_Posterior_Estimate)

dCheckm = data.frame(Rank=dHuman$Rank, M_index=dHuman$M_index, M_Posterior_Estimate=dHuman$M_Posterior_Estimate, 
                    M_Posterior_EstimateL=dHuman$M_Posterior_EstimateL, M_Posterior_EstimateH=dHuman$M_Posterior_EstimateH,
                    Sex="Male")

check_plot_male = ggplot(dCheckm,aes(x=Rank, y=M_Posterior_Estimate, ymin=M_Posterior_EstimateL, ymax=M_Posterior_EstimateH, group=Sex))+ 
     geom_linerange(size=1)+
     geom_point(size=2) +
     geom_point(data=dCheckm,aes(x=Rank, y=M_index),size=2,color=pal[100]) +
     facet_grid(cols=vars(Sex))+
     labs(x="Population ID (sorted)", y="M") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + theme(panel.spacing = unit(1, "lines"))+ 
     theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
    theme(legend.title=element_blank())

 check_plot_male

cor(dHuman$M_Posterior_Estimate, dHuman$M_index)

####################################################### Female
dHuman$Rank_fem = rank(dHuman$M_Posterior_Estimate_fem)
dCheckf = data.frame(Rank=dHuman$Rank_fem, M_index=dHuman$M_index_fem, M_Posterior_Estimate=dHuman$M_Posterior_Estimate_fem, 
                    M_Posterior_EstimateL=dHuman$M_Posterior_EstimateL_fem, M_Posterior_EstimateH=dHuman$M_Posterior_EstimateH_fem,
                    Sex="Female")

check_plot_female = ggplot(dCheckf,aes(x=Rank, y=M_Posterior_Estimate, ymin=M_Posterior_EstimateL, ymax=M_Posterior_EstimateH, group=Sex))+ 
     geom_linerange(size=1)+
     geom_point(size=2) +
     geom_point(data=dCheckf,aes(x=Rank, y=M_index),size=2,color=pal[100]) +
     facet_grid(cols=vars(Sex))+
     labs(x="Population ID (sorted)", y="M") + theme(strip.text.x = element_text(size=12,face="bold"), 
     strip.text.y = element_text(size=12,face="bold"),axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) + theme(panel.spacing = unit(1, "lines"))+ 
     theme(legend.position="bottom") + theme(legend.text=element_text(size=12)) +
    theme(legend.title=element_blank())

 check_plot_female

cor(dHuman$M_Posterior_Estimate_fem, dHuman$M_index_fem,use="pairwise.complete")

############## scatter
data_simp = data.frame(Posterior = c(dHuman$M_Posterior_Estimate,dHuman$M_Posterior_Estimate_fem),
                       Point = c(dHuman$M_index,dHuman$M_index_fem))
plot_simp = ggplot(data_simp, aes(x=Posterior, y=Point)) + 
geom_point() + 
geom_smooth(method=lm, color=pal[1], size=2) +
geom_abline(intercept = 0, slope = 1, linetype=2, size=2, color=pal[100]) + 
labs(x="Posterior median estimate of M", y="Point estimate of M") +
theme(axis.text=element_text(size=12),axis.title=element_text(size=14,
     face="bold"))+theme(strip.text.y = element_text(angle = 360)) 

################################################################### Plot
setwd(paste0(basewd,'/Results'))
ggsave("CheckMale.PDF",check_plot_male,height=6.5, width=6.5)
ggsave("CheckFemale.PDF",check_plot_female,height=6.5, width=6.5)
ggsave("CheckAll.PDF",plot_simp,height=6.5, width=6.5)
setwd(basewd)
  

############################################ Comparative checks

trace1a = traceplot(fit1a,pars=c("A","B","Sigma"))
trace1b = traceplot(fit1b,pars=c("A","B","Sigma"))

trace2a = traceplot(fit2a,pars=c("A","Sigma"))

trace3a = traceplot(fit3a,pars=c("A","B","Sigma"))
trace3b = traceplot(fit3b,pars=c("A","B","Sigma"))


setwd(paste0(basewd,'/Results'))
ggsave("Trace1a.PDF",trace1a,height=6.5, width=8.5)
ggsave("Trace1b.PDF",trace1b,height=6.5, width=8.5)

ggsave("Trace2a.PDF",trace2a,height=6.5, width=8.5)

ggsave("Trace3a.PDF",trace3a,height=6.5, width=8.5)
ggsave("Trace3b.PDF",trace3b,height=6.5, width=8.5)
setwd(basewd)
