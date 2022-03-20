

getstatistics <- function ( directory) {
  
  # descriptive stats for each monitor
  
  
  # get all files - complete and ready data (from getmonitor)
  # print nrow - 111802
  files = list.files(directory)
  ids = trimws(files, 'right', whitespace = '.csv')
  data = data.frame()
  for (i in ids){
    data = rbind(data, get_monitor(i, directory))
  }
  print(nrow(data)) # done
  
  
  # get monthly data + plot
  # ...
  
  
  # aggregate for each monitor and find:
  
  for (i in ids){
    subset = data[data$ID == as.integer(i), ]
    print(i)
    ### startdate and enddate
    print(c(subset$Date[1], subset$Date[nrow(subset)]))
    
    ### how many months worked
    # print(as.integer(ceiling((subset$Date[nrow(subset)] - subset$Date[1])/30)))
    subset['Date1'] = paste(format(subset$Date, "%m"), format(subset$Date, "%m"), sep = ',') # склеил год и месяц
    print(length(unique(subset$Date1))) # нашел длину таких неповторяющихся записей
    # 10 10 11 11 11 12 12 1 2 2
    # 10 11 12 1 2
    
    ### how many observations made - summa len
    print(nrow(subset))
    ### mean sulfate and nitrate for life
    print(c(mean(subset$sulfate), mean(subset$nitrate)))
    ### max and min sulfate and nitrate
    # print(c(mean(subset$sulfate), mean(subset$nitrate)))
  }
  
  
  
  # otvet should be ordered by id
  
  
  
  # otvet
  
  # data.frame with last row:
  
  # id startdate enddate months obs mean.s mean.n max.s max.n...
  
  # .....
  
  # 332 2003-11-30 2004-09-30 8 16 1.4451 0.1881 2.9400000 0.2550000
  
}


getstatistics(getwd())



corr <- function(directory, threshold = 0) {
  
  ## 'directory' - символьная переменная длиной 1, обозначающая
  
  ## место хранения таблиц данных
  
  
  
  
  ## 'threshold' - числовой вектор длиной 1, обозначающий пороговое значение
  
  ## для требуемого количества полных наблюдений, необходимого для
  
  ## расчета корреляции между значениями нитратов и сульфатов. По умолчанию 0
  
  
  
  ## Функция должна возвращать базу данных корреляций значений нитратов и
  
  ## сульфатов для каждого датчика, у которого количество полных наблюдений
  
  ## больше или равно пороговому значению.
  
  
  
  # get all data - complete and ready
  
  # aggregate daily data by id - how many obs made each monitor
  
  # only for monitors with obs >= thr -> cycle for with cor function
  
  # == correlation between sulfate and nitrate
  
  
  
  # otvet
  
  # id corr
  
  # 2 -0.0190
  
  # 154 0.0419
  
  # 248 0.1901
   
  files = list.files(directory)
  ids = trimws(files, 'right', whitespace = '.csv')
  
  data = data.frame()
  for (i in ids){
    data = rbind(data, get_monitor(i, directory))
  }
  
  for (i in ids){
    subset = data[data$ID == as.integer(i), ]
    if (nrow(subset) >= threshold){
      print(round(cor(subset$sulfate, subset$nitrate), 4))
    }
  }
  
}


corr(getwd(), 1000)




















