dat <- data.frame(g=c(1,2), obs=c(1.3, 1.1))

test_func <- function(xx, dat){
  return( eval(parse(text = paste0("print(", "dat", "$", eval(parse(text=paste0(xx))), ")") )) )
}
test_func(g, dat)

dat$g
