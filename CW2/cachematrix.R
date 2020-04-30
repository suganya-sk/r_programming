## Emulate a function that can cache calculating inverse of a matrix

## Converts the input matrix into a special matrix that caches its inverse;
## returns a list that has functions to get and set the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  xInv <- NULL
  get <- function() x

  set <- function(newVal) {
    x <<- newVal
    xInv <<- NULL
  }

  getInverse <- function() xInv

  setInverse <- function(newVal) {
    xInv <<- newVal
  }

  list(get = get,
       set = set,
       getInverse = getInverse,
       setInverse = setInverse
       )
}


## Returns the inverse of the input matrix; if its inverse had been calculated
## previously, it is returned from a cache

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()

  if (is.null(inv)) {
    m <- x$get()
    inv <- solve(m, ...)
    x$setInverse(inv)
    return(inv)
  }
  message('getting inverse from cache')
  inv
}
