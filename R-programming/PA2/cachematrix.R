## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix takes a matrix as an input and creates a special matrix object that
## contains both the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setInverse <- function(srcInv) inv <<- srcInv
  
  getInverse <- function() inv
  
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## cacheSolve computes the inverse of the matrix x created from the function makeCacheMatrix
## If the inverse of the matrix has already been computed, and
## the matrix has not changed, it returns the inverse from the matrix's cache
cacheSolve <- function(x, ...) {  
      matInv <- x$getInverse()
      
      if(is.null(matInv)) { # matInv is invalid and should be recomputed
        message("computing inverse of x")
        matInv <- solve(x$get())
        x$setInverse(matInv)
      } 
      else {  # matInv is valid
        message("getting inverse from cache")
      }
      return(matInv)
}