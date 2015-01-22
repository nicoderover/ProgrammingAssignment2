## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function stores the matrix, creates four functions, and return all functions in a list
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x #get is simply a function that returns x
        setinvmatrix <- function(solve) m <<- solve
        getinvmatrix <- function() m
        list(set = set, get = get,
             setinvmatrix = setinvmatrix,
             getinvmatrix = getinvmatrix)
} 

## Write a short comment describing this function
# This functions return m if m is not null, else it returns the inverse of the matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinvmatrix() # m is NULL given the function above
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinvmatrix(m) #assigns m to m in the global environment
        m #return m from function environment first (same as global environment in this case)
}

## Example
# x <- matrix(rnorm(4),2,2)
# superMatrix <- makeCacheMatrix(x)
# cacheSolve(superMatrix)
