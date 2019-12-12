setwd("Desktop/Sophomore_Year/bc/examples/exercises/ICB2019_Exercise10/")

K=1e6
rN=0.1
Nt=99
Mt=1
timesteps=1000
N=numeric(length = timesteps)
N[1]<-Nt

K=1e6
rM=0.1
Mt=1
Nt=99
timesteps=1000
M=numeric(length = timesteps)
M[1]<-Mt

rMtreatment<- 0.05
rNtreatment<- -0.1

#for loop
for (t in 1:(timesteps-1)) {
  if(t<300){
    N[t+1]=N[t]+rN*N[t]*(1-(N[t]+M[t])/K)
    M[t+1]=M[t]+rM*M[t]*(1-(N[t]+M[t])/K)
  } else{
    N[t+1]=N[t]+rNtreatment*N[t]*(1-(N[t]+M[t])/K)
    M[t+1]=M[t]+rMtreatment*M[t]*(1-(N[t]+M[t])/K)
  }
}

#plot
plot(1:timesteps, N, type="l", col="blue")
lines(1:timesteps, M, col="red")
legend('right', legend = c("Mutant", "Normal"), col = c("red", "blue"), lty = 1)

       