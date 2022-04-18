pb <- txtProgressBar(min = 1, max = Nsim, style = 3)

for(isim in 1:Nsim){
    setTxtProgressBar(pb, isim)
    if(isim %in% ceiling(Nsim*1:9/10))
        cat(isim,"-th: ", format(Sys.time(), "%Y %b %d %X"), "estimated at ", format(Sys.time()+(Sys.time()-starttime)*(Nsim-isim)/isim, "%Y %b %d %X"),"\n")
}

