dett = function(mat){
  
}


mat = matrix(c(1,3,0,5, 0,0,0,0, 10, 16, 8, 6, 2,3,1,8), 4,4, T)

lindeprows = function(mat){
  for (i in 1:nrow(mat)){
    vec = mat[i, ]
    rest_mat = mat[-i, ]
    # div_mat = rest_mat / vec[col(rest_mat)]
    TF = apply(div_mat, 1, function(i) {
      if () T
      else F
    })
    if (any(
      TF
    )) stop('linearly dependent')
  }
  return(T)
}

lindepcols = function(mat){
  for (i in 1:nrow(mat)){
    vec = mat[, i]
    rest_mat = mat[, -i]
    div_mat = rest_mat / vec
    TF = apply(div_mat, 2, function(i) {
      if (length(unique(i)) == 1) T
      else F
    })
    if (any(
      TF
    )) stop('linearly dependent')
  }
  return(T)
}

any(is.na(mat))
apply(mat, 1, all)

any(apply(mat, 1, all) == F)
apply(mat, 1, function(i) all(i == 0))
