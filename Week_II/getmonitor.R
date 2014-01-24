getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  # ��idתΪ��λ��ʾ
  
  id_Mod <- sprintf("%03d" , as.numeric(id))       
  file_Name <- sprintf("%s/%s.csv" , directory , id_Mod)  
  my_Data <- read.csv(file_Name)
  if(summarize){
    print(summary(my_Data))
  }
  
  # �ǵ�return
  
  return(my_Data)
}