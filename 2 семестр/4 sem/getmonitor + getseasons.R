# 1. Реализация задачи - планирование идеи, ваш концепт решения
# * комментирование кода
# 2. is.numeric \ is.na \ is...
# is.na(id) == T <=> is.na(id)
# 3. большие, последовательные if`ы
# 4. использовать разборчивые наименования
# for (i in vector)
# золторая середина между удобством быстро набирать ваши переменные (initial_data_wona_and..) и пониманием того, что 
# скрывается за переменными
# 5. оборачивать выход функции в ретерн
# a. позволяет контролировать выход функции б. в питоне, например, без return`a функция ничего не выдаст (None)
# 6. не стрематься искать в гугле
# 
# some tips:
# 1. последовательности можно писать как 1:n, так и n:1
# 2. два вида итераций:
# for (i in 1:length(vector)) -> итерируемся по индексам
# for (i in vector) -> итерируемся по элементам
# 
# Старайтесь пистаь нормальные тесты
# 1. выдает то, что вам нужно
# 2. выдает то, что вам нужно, всегда

# -----------------------------
# length check
# if incorrect id - stop("message to user")
# character or numeric
# character -> numeric integer #check if possible
# numeric -> to integer if possible
# check if 1 to 332
# 
# if <10 <100
# 2 read.csv + get data ready: format dates, check if numeric sulf nitr, delete empty
# 3 suumary if needed (print)
# return data

setwd('C:\\Users\\gua4d\\Desktop\\specdata')
get_monitor = function(id, directory, summarize = FALSE){
  if(is.na(as.integer(id))) stop('id is not valid')
  id = as.integer(id)
  if (id >= 1 & id <= 332) {
    # nothing to do
  } else stop('id is not valid')
  
  id = paste(c(rep(0, 3-nchar(id)), id), collapse = '')
  data = read.csv(file.path(directory, paste(id, '.csv', sep= '')))
  
  if (summarize){
    summary = summary(data)
    print(colnames(data))
    for (i in 1:6){
      cell = data$Date[i]
      print(paste(cell, summary[i + 7], summary[i + 7*2], summary[i + 7*3], sep = ' |'))
    }
    # (Other) :724 NA's :666 NA's :666
    print(paste('Other : ', summary[14], summary[22]))
  }
  
  data$Date = as.Date(data$Date)
  data= na.omit(data)
  return(data)
}


getseasons <- function(id,directory,factor,byid=F) {
  
  dataset = data.frame()
  for (i in id){
    dataset = rbind(get_monitor(i, directory, F), dataset)
  }
  
  if (byid){
    tagg = aggregate(dataset, list(id = dataset$ID, 
                            month = format(dataset$Date, "%m")), mean)
  } else {
    tagg = aggregate(dataset, list(
                                  month = format(dataset$Date, "%m")), mean)
  }
}


