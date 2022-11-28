############################################################ Functions
 ScaleBeta <- function(X){# Scales values to unit interval
    a = 0
    b = 1
    y = X
    Samp = 50
    y2 = (y-a)/(b-a)
    y3 = (y2*(Samp - 1) + 0.5)/Samp
    return(y3)
    }
                          
Mraw_index <- function(r,t){
    R = sum(r)
    T = sum(t)
    N = length(t)
    si = ((r/R)-(t/T))^2
    S = sum(si)
    C = (N * S)
     if(R>0){
      return(C)}
      else{
      return(NA)
      }
    }

M_index = function (r, t, Samples = 50){
    if (min(t) <= 0) {
        return(NA)
    }
    else {
        E_Mraw = rep(NA, Samples)
        R = sum(r)
        t_hat = t/sum(t)
        for (j in 1:Samples) {
            E_Mraw[j] = Mraw_index(rmultinom(1, R, t_hat), t)
          }
        M = Mraw_index(r, t) - mean(E_Mraw)
        return(M)
    }
}

Gini_index <- function (x, corr = FALSE, na.rm = TRUE) 
{
    if (!na.rm && any(is.na(x))) 
        return(NA_real_)
    x <- as.numeric(na.omit(x))
    n <- length(x)
    x <- sort(x)
    G <- sum(x * 1L:n)
    G <- 2 * G/sum(x) - (n + 1L)
    if (corr) 
        G/(n - 1L)
    else G/n
}

N25 =  function(x){
 length(x[which(x>=25)])
 }

RS0A25 =  function(x,y){
 dat = data.frame(x,y)
 dat2 = dat[which(dat[,1]>=25),]
 length(which(dat2[,2]==0))
 }

PercRS0A25 =  function(x,y){
 dat = data.frame(x,y)
 dat2 = dat[which(dat[,1]>=25),]
 round(length(which(dat2[,2]==0))/length(dat2[,2]),2)
 }

N45 =  function(x){
 length(x[which(x>=45)])
 }

RS0A45 =  function(x,y){
 dat = data.frame(x,y)
 dat2 = dat[which(dat[,1]>=45),]
 length(which(dat2[,2]==0))
 }

PercRS0A45 =  function(x,y){
 dat = data.frame(x,y)
 dat2 = dat[which(dat[,1]>=45),]
 round(length(which(dat2[,2]==0))/length(dat2[,2]),2)
 }
 
N0 =  function(x){
 length(x)
 }

RSmean =  function(y){
 mean(y)
 }

RSsum =  function(y){
 sum(y)
 }

Exposuresum =  function(x){
 sum(x)
 }

RSsd =  function(y){
 sd(y)
 }

RSvar =  function(y){
 var(y)
 }

RScv =  function(y){
 sd(y)/mean(y)
 }

RSofs =  function(y){
 var(y)/(mean(y)*mean(y))
 }

RateGini = function (y,x, corr = FALSE, na.rm = TRUE)
{
y = y/x
    if (!na.rm && any(is.na(y)))
        return(NA_real_)
    y  =  as.numeric(na.omit(y))
    n  =  length(y)
    y  =  sort(y)
    G  =  sum(y * 1L:n)
    G  =  2 * G/sum(y) - (n + 1L)
    if (corr)
        G/(n - 1L)
    else G/n
}

B_index  =  function(r,t) {   #r=rs,t=exposure
           T  =  sum(t)
           Nbar  =  T / max(t)
           R  =  sum(r)
           if(R>0){
           B = sum((r / R - t / T)^2) - (1 / R) * (1 - 1 / Nbar)
           } else {
           B = NA
           }
           return(B)
           }
           
 MergeRes  =  function(Exposure, RS, NHM=FALSE){
                               if(NHM==FALSE){
    Exposure  =  ifelse(Exposure>60,60,Exposure)

    RS = RS[which(Exposure >= 15)]
    Exposure = Exposure[which(Exposure >= 15)]

    Exposure  =  Exposure - 12
         }

   M_index_stan(RS,Exposure, chains=1)

   Mraw_post  =  extract(StanResults, pars="M_raw")$M_raw
   Mraw_age_post  =  extract(StanResults, pars="M_raw_age")$M_raw_age

   M_post  =  extract(StanResults, pars="M")$M
   M_age_post  =  extract(StanResults, pars="M_age")$M_age

   Gamma_post  =  extract(StanResults, pars="gamma")$gamma

  c(
  N25(Exposure),RS0A25(Exposure,RS),PercRS0A25(Exposure,RS),N45(Exposure),RS0A45(Exposure,RS),PercRS0A45(Exposure,RS),
  N0(RS),RSsum(RS),Exposuresum(Exposure),RSmean(RS),RSsd(RS),RSvar(RS),RScv(RS), RSofs(RS),Gini_index(RS),
  RateGini(RS,Exposure),B_index(RS,Exposure),Mraw_index(RS,Exposure),M_index(RS,Exposure),
  mean(Mraw_age_post), mean(M_age_post),
  HPDI(c(Mraw_age_post,0.9))[1], HPDI(c(M_age_post,0.9))[1],  
  HPDI(c(Mraw_age_post,0.9))[2], HPDI(c(M_age_post,0.9))[2],  
  sd(Mraw_age_post), sd(M_age_post),
  mean(Gamma_post), HPDI(c(Gamma_post,0.9))[1], HPDI(c(Gamma_post,0.9))[2]
  )
 }

skew_scatter_plot  =  function(Exposure,RS, Save=FALSE){
  df_sk  =  data.frame(RS=RS, Age=Exposure)

  p = ggplot(df_sk, aes(x=Age, y=RS)) + 
  geom_jitter()+
  geom_smooth( color="white", fill='darkorange2', alpha=0.6)
  print(p)
  if(Save != FALSE){
  ggsave(file=paste0(Save,".pdf"), p,width=4,height=4) 
               }
  }

real_length <- function(X,Thresh){
    return( length(X[which(X >= Thresh)]))
         }

skew_trace_plot  =  function(RS,Save=FALSE,Thresh=15){
   x = sample(1:real_length(RS,Thresh),3)
   X = paste0(c("alpha[","alpha[","alpha["),x,c("]","]","]"))
   p = traceplot(StanResults, pars=c("gamma", "Concentration", "M_raw", "M", "M_raw_age", "M_age",X))
   print(p)
   if(Save != FALSE){
   ggsave(file=paste0(Save,".pdf"), p,width=12,height=4) 
               }
  }
  
summySum = function(X, label){
            out = data.frame(Label=rep(label,3),Effect=c("M","F","D")) 
            res = extract(X, pars="B")$B

            out$Median = apply(res,2,median)
            out$L = apply(res,2,HPDI)[1,]
            out$H = apply(res,2,HPDI)[2,]

            return(out)
            }

summySumA = function(X, label){
            out = data.frame(Label=rep(label,3),Effect=c("M","F","D")) 

            res = extract(X, pars="A")$A

            bob = apply(res,2:4,median)

            bobL = apply(res,2:4,HPDI)[1,,,]
            bobH = apply(res,2:4,HPDI)[2,,,]

            bobEffect=bob
            bobEffect[,,1] = matrix("M",nrow=2,ncol=3)
            bobEffect[,,2] = matrix("F",nrow=2,ncol=3)
            bobEffect[,,3] = matrix("D",nrow=2,ncol=3)
            
            bobHum=bob
            bobHum[,,1] = matrix(c("NHM","Human","NHM","Human","NHM","Human"),nrow=2,ncol=3)
            bobHum[,,2] = matrix(c("NHM","Human","NHM","Human","NHM","Human"),nrow=2,ncol=3)
            bobHum[,,3] = matrix(c("NHM","Human","NHM","Human","NHM","Human"),nrow=2,ncol=3)

            bobPoly=bob
            bobPoly[,,1] = matrix(c("Monogamy", "Monogamy", "Polygyny Permitted", "Polygyny Permitted", "Polygyny Common", "Polygyny Common"),nrow=2,ncol=3)
            bobPoly[,,2] = matrix(c("Monogamy", "Monogamy", "Polygyny Permitted", "Polygyny Permitted", "Polygyny Common", "Polygyny Common"),nrow=2,ncol=3)
            bobPoly[,,3] = matrix(c("Monogamy", "Monogamy", "Polygyny Permitted", "Polygyny Permitted", "Polygyny Common", "Polygyny Common"),nrow=2,ncol=3)

            out = data.frame(median=c(bob), L=c(bobL), H=c(bobH), Effect=c(bobEffect), Group=c(bobHum), System=c(bobPoly), Label=label)

            return(out)
            }

sqrt2 = function(x){
    sign(x) * abs(x)^(1/2)
}


us_to_space = function(x){
    gsub(pattern = "_", replacement = " ", x = x)
}
