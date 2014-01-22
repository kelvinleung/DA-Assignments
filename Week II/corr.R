corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # 简述题目目的
  
  ## for each file in the directory 
  ## read the file 
  ## find the number of complete cases in that file 
  ## if the number of complete cases is greater than the threshold number then 
  ## use R's built in cor function to calculate the correlation between sulfate and nitrate for that file 
  ## stick the result of the cor function onto the end of a numeric vector
  ## end if 
  ## next file 
  ## return the numeric vector
  
  # 初始化变量
  
  my_Cor <- vector(mode="numeric")
  id <- 1:332
  
  for(i in id){
    id_Mod <- sprintf("%03d" , as.numeric(i))
    file_Name <- sprintf("%s/%s.csv" , directory , id_Mod)  
    my_Data <- read.csv(file_Name)
    n_Complete <- nrow(na.omit(my_Data))
    if(n_Complete > threshold){
      
      # cor(use="pairwise.complete.obs")，直接处理缺失值
      
      my_Cor[i] <- cor(my_Data$sulfate,my_Data$nitrate,use="pairwise.complete.obs")
    }
  }
  
  return(my_Cor)
}