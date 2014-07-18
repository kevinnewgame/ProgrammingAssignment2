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

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
