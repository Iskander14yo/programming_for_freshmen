fib = function(n){
  if (n == 1) return (0)
  if (n == 2) return (1)
  else return(fib(n-1) + fib(n-2))
}

# note: вычисление чисел фиб методом выше
# крайне наивное и потому крайне медленное

f = function(x){
  return(x^2)
}

extr_fib = function(a,b, n = 10){
  for (i in n:3){
    x1 = a + (b-a)*fib(i-2)/fib(i)
    x2 = a + (b-a)*fib(i-1)/fib(i)
    y1 = f(x1); y2 = f(x2)
    if (y1 > y2){
      a = x1; x1 = x2
      x2 = b - (x1 - a)
      # y1 = y2; y2 = f(x2)
    } else {
      b = x2; x2 = x1
      x1 = a + (b-x2)
      # y2 = y1; y1 = f(x1)
    }
    if (i == 3){
      x = (x1 + x2)/2
      y = f(x)
      return(c(x,y))
    }
  }
}

