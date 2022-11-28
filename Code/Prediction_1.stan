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
  vector[K] A;
  vector[K] B;
}

model{
   vector[N] Mu[K];  
   vector[N] Omega[K];                           

    Sigma[1] ~ cauchy(0,2.5); 
    Sigma[2] ~ cauchy(0,2.5); 

    A ~ normal(0, 5);  
    B ~ normal(0, 5);  

    for(i in 1:N){ 
     Mu[1,i] = A[1] + B[1]*Human[i];
     Mu[2,i] = A[2] + B[2]*Human[i];
     Mu[3,i] = A[3] + B[3]*Human[i];

     Omega[1,i] = Sigma[Human[i]+1, 1];
     Omega[2,i] = Sigma[Human[i]+1, 2];
     Omega[3,i] = Sigma[Human[i]+1, 3];
                }

    M ~ normal(Mu[1], Omega[1]);
    F ~ normal(Mu[2], Omega[2]);
    D ~ normal(Mu[3], Omega[3]);
  }
