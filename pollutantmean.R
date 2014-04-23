pollutantmean <- function(directory = "specdata" , pollutant, id = 1:332) {
    filelist <- list.files(directory)
	datavalues <- numeric()
	if (pollutant == "nitrate"){
		poll <- 3
	}
	else{
		poll <- 2
	}
	for (i in id){
		filename <- filelist[i]
		fileread <- read.csv(file.path(directory,filename))
		columndata <- fileread[,poll]
		datavalues <- c(datavalues, columndata)
	}
	print(mean(datavalues, na.rm = TRUE))
}
