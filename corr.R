corr <- function(directory = "specdata", threshold = 0) {
	id <- 1:332
	filelist <- list.files(directory)
	corrvalues <- numeric()
	for (i in id){
		filename <- filelist[i]
		fileread <- read.csv(file.path(directory,filename))
		fileread <- na.omit(fileread)
		nob <- NROW(fileread)
		if(nob >= threshold){
			corr <- cor(fileread[,3], fileread[,2])
			corrvalues <- c(corrvalues, corr)
		} 
	}
	return(signif(corrvalues, digits = 4))
}