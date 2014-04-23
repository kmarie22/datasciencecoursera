
complete <- function(directory = "specdata" ,  id = 1:332) {
    filelist <- list.files(directory)
	datavalues <- data.frame(id = numeric(),
					nobs = numeric())
	for (i in id){
		filename <- filelist[i]
		fileread <- read.csv(file.path(directory,filename))
		fileread <- na.omit(fileread)
		nob <- NROW(fileread)
		datavalues <- rbind(datavalues, data.frame(id = i, nobs = nob)) 
		}
	print(datavalues)
}
