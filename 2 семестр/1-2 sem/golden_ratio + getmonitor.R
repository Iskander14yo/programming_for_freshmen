func = function(x){
  return(
    3x**2 + 5*x + 7
    )
}

golden_ratio = function(a,b, eps, n_steps, type){
  # код для type: max\min
  # sign = 1; sign = -1
  # алгоритм тот же самый, но сравнивать y * sign
  
  # берем пустой массив: вектор или лист
  # посчитали x1, x2
  while error > eps and steps < n_steps{
    # считаем y1, y2
    if {} # обновляем х1, х2 
    else # обновляем х1, х2
    # добавляем значения в векторе
  }
  return ((x1+x2)/2)
}

graphics = function( #массив
){
  
  points(
    # массив
    ,
    # func(массив)
  )
}

a = -2
b = 2
seq(a,b,0.01)




########################################

data = read.csv('C:\\Users\\gua4d\\Desktop\\specdata\\101.csv')
require(tibble)
data = tibble(data)

summ = summary(data)

require(datasets)
data(iris)

iris
aggregate(iris, list(Name = iris$Species), max)
