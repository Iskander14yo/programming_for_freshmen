foo = function(x, y){
  x^2 + y^2
}

foo1 = function(x){
  if (x == 1) return (-1)
  else return (1)
}

hooke_jeevse = function(w, h=.01, n = 1900){
  # w - вектор начального приближения
  
  for (i in 1:n){
    for (j in 1:length(w)){
      # w[j] = argmin(w[j] + h, w[j] - h)
      
      calculated_dots = c(foo(w[j] - h, w[-j]), foo(w[j] + h, w[-j]))
      w[j] = w[j] + foo1(which(calculated_dots == min(calculated_dots)))*h
      print(w)
    }
  }
  return(c(w, foo(w[1], w[2])))
}

hooke_jeevse(c(5,5))
