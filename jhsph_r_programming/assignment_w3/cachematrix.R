## It return a list of functions to set and get the
## inverse of a given matrix.
## When any of the 'set' functions of the returned list
## are called, they access the variables in the
## environment of this function.

makeCacheMatrix <- function(x = matrix()) {
    inv_matrix <- NULL
    setMatrix <- function(y){
        x <<- y
        inv_matrix <<- NULL
    }
    getMatrix <- function(){
        x
    }
    setInvMatrix <- function(inverse) {
        inv_matrix <<- inverse
    }
    getInvMatrix <- function() {
        inv_matrix
    }
    list(setMatrix = setMatrix,
         getMatrix = getMatrix,
         setInvMatrix = setInvMatrix,
         getInvMatrix = getInvMatrix)
}

## Return a matrix that is the inverse of matrix passed
## as an argument to the function makeCacheMatrix.
## If the inverse has already been calculated,
## it returns it; otherwise it calculates it and
## put it in the cache variable.
## The argument is the list of functions returned
## by makeCacheMatrix.

cacheSolve <- function(x, ...) {
    inv_matrix <- x$getInvMatrix()
    if(!is.null(inv_matrix)){
        message("Getting cached inverse matrix")
        return(inv_matrix)
    }
    matrix <- x$getMatrix()
    inv_matrix <- solve(matrix,...)
    x$setInvMatrix(inv_matrix)
    inv_matrix
}