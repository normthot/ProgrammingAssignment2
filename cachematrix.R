## These two functions are used to set or get a square invertible
## matrix in a cache as well as do the matrix inversion.

## makeCacheMatrix accepts a matrix and returns four functions.
## These functions can be used to 1) set the matrix, 2) get the
## matrix, 3) set the inverse of the matrix, 4) get the inverse
## of the matrix.

makeCacheMatrix <- function(x = matrix()) {
    matinv <- NULL
    set <- function(y) {
        x <<- y
        matinv <<- NULL
    }
    get <- function() x
    setmatinv <- function(inverse) matinv <<- inverse
    getmatinv <- function() matinv
    list(set = set, get = get,
         setmatinv=setmatinv,
         getmatinv=getmatinv)
}


## cacheSolve either calculates the inverse of a given matrix
## or else simply returns a previously calculated inverse (thereby
## saving processing time).

## x matrix provided by the caller (makeCacheMatrix()) is the
## input

cacheSolve <- function(x, ...) {
    matinv <- x$getmatinv()
    
    ## Check if this inverse has already been calculated...
    if (!is.null(matinv)) {
        message("getting cached data")
        return(matinv)
    }
    
    ## Not in cache, go ahead and do the inverse calculation.
    mattmp.data <- x$get()
    matinv <- solve(mattmp.data, ...)
    
    ## Ok, save the new inverse matrix calculation in the cache.
    x$setmatinv(matinv)
    return(matinv)
}
