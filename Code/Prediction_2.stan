data{ 
  int N;   
  int K;  

  int Human[N];
  int Monogamous[N];

  vector[N] M;            
  vector[N] F;            
  vector[N] D;    
 }
 
parameters{ 
  vector<lower=0>[K] Sigma[2];       
 
  vector[K] A[2,3];
 } 

model{ 
    vector[N] Mu[K];      
    vector[N] Omega[K];                       
 
    Sigma[1] ~ cauchy(0,2.5); 
    Sigma[2] ~ cauchy(0,2.5); 
  
    A[1,1] ~ normal(0, 5);
    A[1,2] ~ normal(0, 5); 
    A[1,3] ~ normal(0, 5);
    A[2,1] ~ normal(0, 5); 
    A[2,2] ~ normal(0, 5);  
    A[2,3] ~ normal(0, 5);    

    for(i in 1:N){ 
             Mu[1,i] = A[Human[i]+1, Monogamous[i], 1];
             Mu[2,i] = A[Human[i]+1, Monogamous[i], 2];
             Mu[3,i] = A[Human[i]+1, Monogamous[i], 3];

             Omega[1,i] = Sigma[Human[i]+1, 1];
             Omega[2,i] = Sigma[Human[i]+1, 2];
             Omega[3,i] = Sigma[Human[i]+1, 3];
                }

    M ~ normal(Mu[1], Omega[1]);
    F ~ normal(Mu[2], Omega[2]);
    D ~ normal(Mu[3], Omega[3]);
     
} 



