complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # 初始化变量
  
  n <- length(id)
  col_Id <- 1:n
  col_Nobs <- 1:n
  j <- 1
  
  for(i in id){
    id_Mod <- sprintf("%03d" , as.numeric(i))
    file_Name <- sprintf("%s/%s.csv" , directory , id_Mod)  
    my_Data <- read.csv(file_Name)
    n_Complete <- nrow(na.omit(my_Data))
    
    # 字段赋值
    
    col_Id[j] <- i
    col_Nobs[j] <- n_Complete
    j <- j+1
  }
  
  # 处理返回值
  
  my_Output <- as.data.frame(cbind("id"=col_Id,"nobs"=col_Nobs))
  return(my_Output)
}