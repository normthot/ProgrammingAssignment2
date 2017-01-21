Local_Test = function(m_in) {
    ## @m_in: is the given invertible matrix.
    
    wrkmat = makeCacheMatrix(m_in)
    
    start1.time = Sys.time()
    cacheSolve(wrkmat)
    elapsed = Sys.time() - start1.time
    print(elapsed)
    
    start2.time = Sys.time()
    cacheSolve(wrkmat)
    elapsed = Sys.time() - start2.time
    print(elapsed)
    
    ## Example data used for testing:
    ## > set.seed(7211955)
    ## > rn<-rnorm(5000000)
    ## > mattest = matrix(rn, nrow=1000, ncol=1000)
    ## > source("cachematrix.R")
    ## > source("Local_Test.R")
    ## > Local_Test(mattest)
    
    ## Result:
    ## Time difference of 1.072214 secs
    ## getting cached data
    ## Time difference of 0 secs    
}