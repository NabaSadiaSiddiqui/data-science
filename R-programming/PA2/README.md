Files under PA2 have been forked from https://github.com/rdpeng/ProgrammingAssignment2.  
They have been consolidated under my repository **statistical-computing-R** for  
organizational purposes

It contains 2 functions that cache the inverse of a matrix:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

It assumes that the matrix used is always invertible
