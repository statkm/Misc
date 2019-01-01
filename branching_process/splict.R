fam_state <- as.list(NA)
n_ini <- 100
pp<-0.9
KK<-50
gmax <- 100

for(k in 1:KK){
  n <- numeric(1)
  n[1] <- n_ini
  i<-1
  while(n[i]!=0 & i <=gmax){
    n <- c(n, rbinom(n=1,size=n[i], prob = pp))
    i <- i+1
  }
  
  fam_state[[k]] <- n
}

max(as.numeric(lapply(fam_state, max)), gmax) -> maxfamily
max(as.numeric(lapply(fam_state, length))) -> maxfam

plot(0,0, type="n", xlim=c(0,maxfam), ylim=c(0,maxfamily),xlab="gen", ylab="# of offsprings")

for(k in 1:KK){
  par(new=T)
  plot(x=0:(length(fam_state[[k]])-1), y=fam_state[[k]], xlim=c(0,maxfam), ylim=c(0,maxfamily),xlab="gen", ylab="# of offsprings", type="l")
}
par(new=T)
curve(pp^x*n_ini,xlim=c(0,maxfam), ylim=c(0,maxfamily), col="red" , xlab="", ylab="", lwd=2)







fam_state <- as.list(NA)
n_ini <- 100
KK<-50
l_ini <- .99
gmax <- 100
for(k in 1:KK){
  n <- numeric(1)
  n[1] <- n_ini
  i<-1
  while(n[i]!=0 & i <=gmax){
    ntemp<-0
    n <- c(n, sum(rpois(n=n[i], lambda = l_ini)))
    i <- i+1
  }
  
  fam_state[[k]] <- n
}

max(as.numeric(lapply(fam_state, max)), gmax) -> maxfamily

max(as.numeric(lapply(fam_state, length))) -> maxfam

plot(0,0, type="n", xlim=c(0,maxfam), ylim=c(0,maxfamily),xlab="gen", ylab="# of offsprings")

for(k in 1:KK){
  par(new=T)
  plot(x=0:(length(fam_state[[k]])-1), y=fam_state[[k]], xlim=c(0,maxfam), ylim=c(0,maxfamily),xlab="gen", ylab="# of offsprings", type="l")
}
par(new=T)
curve(l_ini^x*n_ini,xlim=c(0,maxfam), ylim=c(0,maxfamily), col="red" , xlab="", ylab="", lwd=2)
