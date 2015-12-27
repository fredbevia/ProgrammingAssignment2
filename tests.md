### tests of the functions of cache matrix
to tests the functions, we need an invertible matrix:

	> y<-matrix(c(1,2,1,3,5,0,4,2,6),3,3) # creating an invertible matrix 3x3
	> y
  			[,1] [,2] [,3]
	[1,]    1    3    4
	[2,]    2    5    2
	[3,]    1    0    6
	> 

Then we compute the inverse of y:

	> yinv <-solve(y) # computing the inverse of y 
	> yinv
	      [,1]  [,2]  [,3]
	[1,] -1.50  0.90  0.70
	[2,]  0.50 -0.10 -0.30
	[3,]  0.25 -0.15  0.05
    
We verify that it's correct:

	> yinv%*%y
            	[,1] [,2]          [,3]
	[1,] 1.000000e+00    0 -8.881784e-16
	[2,] 0.000000e+00    1  2.220446e-16
	[3,] 1.387779e-17    0  1.000000e+00

By the way we can see that's not exactly the identity matrix. We should 
have only ones on the first diagonal, and zero anywhere else. We have 
some value "near" zero, but it's okay 

### now we test ours functions.

a) creating x:

	> x<-makeCacheMatrix()
	> 
b) setting x vith y

	> x$set(y)
	> x$get()
	     [,1] [,2] [,3]
	[1,]    1    3    4
	[2,]    2    5    2
	[3,]    1    0    6

c) computing the inverse:

	> cacheSolve(x)
 	     [,1]  [,2]  [,3]
	[1,] -1.50  0.90  0.70
	[2,]  0.50 -0.10 -0.30
	[3,]  0.25 -0.15  0.05
 
d) computing the inverse again: 

	> cacheSolve(x)
	getting cached inverse of the matrix  

** we got the message ! :-))**

      	[,1]  [,2]  [,3]
	[1,] -1.50  0.90  0.70
	[2,]  0.50 -0.10 -0.30
	[3,]  0.25 -0.15  0.05

### that's ok !!

### So we test with another invertivle matrix (2x2):

	> z<-makeCacheMatrix()
	> w <-matrix(c(1,0,-3,1),2,2)
	> solve(w)
	     [,1] [,2]
	[1,]    1    3
	[2,]    0    1
	> w%*%solve(w)
	     [,1] [,2]
	[1,]    1    0
	[2,]    0    1
	> z$set(w)
	> z$get()
	    [,1] [,2]
	[1,]    1   -3
	[2,]    0    1
	> cacheSolve(z)
	     [,1] [,2]
	[1,]    1    3
	[2,]    0    1
	> cacheSolve(z)
	getting cached inverse of the matrix
 	    [,1] [,2]
	[1,]    1    3
	[2,]    0    1
	> 
#### it's also ok for this matrix
So it's seems that ours functions does the job :-)
