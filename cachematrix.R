## There is two fonctions this file:
## the first one, makeCacheMatrix create an object, with geters, seters 
## wich contain a cached matrix and eventually his inverse
## the second function, cacheSolve compute the inverse of x, if these 
## inverse doesn't exist, and cache it in the object created with 
## makeCacheMatrix.
## 
## Write a short comment describing this function
## this function create an object x with the matrix y 
## (as a parameter of the function set),but in the parent environnement
## (aka global environnement here)
## it does the same thing for the inverse of the matrix x, with the 
## function setinv(),  this inverse calculated in the function cacheSolve.
## in this object  there are also the functions (methods) get and getinv 
## witch allow to access at the value cached of the matrix x and the 
## value  cached of his inverse (if computed) in the parent environment.
## Nota Bene: Intead of the <<- operator, we could use the assign 
## function

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(matinv) inv <<- matinv
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function
## this function compute the inverse of the matrix x cached 
## but before using the function solve to do it, tests if the inverse of
## x already exists, and if it is the case, return directly this inverse.
## remarks:
## a) for the purpose of testing, if the inverse exists then cacheSolve 
##   print a message
## b) to compute the inverse, we could use the package MASS and the 
## ginv() function in it.
## c) the file test.rmd shows some tests (on Rstudio) with these function 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached inverse of the matrix")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}
