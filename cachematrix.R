## Calculate the inverse of a matrix, caching its results if not changed for computational efficiency

## Create a list of functions to set matrix values, get its value, set inverse and get inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  
  list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
  
}


## Get inverse of matrix or return a cached result if found

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("Getting cache data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
  
}

mat <- makeCacheMatrix()
mat$set(matrix(c(1,2, 3, 4), nrow = 2))

