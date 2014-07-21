## We assign function makeCacheMatrix and its input, say a matrix
## to a symbol like this: "A <- makeCacheMatrix(X)". Then we can
## set the inverse of "X" and save in A, set a new matrix to 
## substitute "X", and get "X". After that we can check whether we
## set the inverse of "X" in A by using function cacheSolve like
## this: "cacheSolve(A)". If not, cacheSolve gives us a inverse of
## X.

## Four function in A. They are
## 1. getmatrix() # get the input of makeCacheMatrix, that is "X"
## 2. setmatrix() # give a new matrix to substitute "X" in A
## 3. setinverse() # give a matrix. We can calculate the inverse
## of "X" and save it in A
## 4. getinverse() # get the matrix we set

## We use them in this way: A$getmatrix(), A$setmatrix("your matrix")
## For this assignment, assume that the matrix supplied is always invertible.

MakeCacheMatrix <- function(x = numeric()){
        inv <- NULL
        setinverse <- function(y) inv <<- y
        getinverse <- function() inv
        
        getmatrix <- function() x
        setmatrix <- function(y){
                x <<- y
                inv <<- NULL
        }
        list(setinverse = setinverse,
             getinverse = getinverse,
             getmatrix = getmatrix,
             setmatrix = setmatrix)
}

## Function cacheSolve determine whether there is already inverse matrix
## in previous function MakeCacheMatrix. If there is not, cacheSolve gives
## the inverse of matrix in MakeCacheMatrix. If there is, it return the
## message "getting cached data" and the inverse matrix.

cacheSolve <- function(X, ...) {
        ## Return a matrix that is the inverse of 'x'
        
	inv <- X$getinverse()
        if( is.null(inv)){
                matrix <- X$getmatrix()
                inv <- solve(matrix)
        }
        else{
                message("getting cached data")
                return(X$getinverse())
        }
        X$setinverse(inv)
        inv
}
