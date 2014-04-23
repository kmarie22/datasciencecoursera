add2 <- function(x,y){
	x + y
}

above10 <- function(x){
	use <- x > 10
	x[use]
}

above <- function(x,n = 10){
	use <- x > n
	x[use]
}

columnmean <- function(x){
	nc <- ncol(x)
	means <- numeric(nc)
	for(i in nc){
		means[i] <- mean(y[,i])
	}
	means
}