## First function create a special object, that can cache its inverse, but
## does not compute its inverse (it has to be set). Second function computes
## inverse of the given matrix if it hasn't already been set and prints it;
## otherwise, the cached inverse is printed.  

## This function stores other functions. It takes an object (which has to be a
## matrix) and enables to get or set the argument of the function and set 
## and get inverse of its argument. 

makeCacheMatrix <- function(x = matrix()) { ## argument has to be a matrix

		c = NULL				  ## in "c" object the inverse of a matrix is stored. It takes NULL value as long as inverse hasn't been set or argument x changes (see below). 

		set = function(y = matrix()) {  ## set function sets its argument as an argument for a main function
			x <<- y 
			h = NULL
			c <<- h			  ## it clears c object (inverse of a matrix) every time a new matrix is set as an argument of makeCacheMatrix function	
			} 

		get = function() {x}		  ## prints argument of makeCacheMatrix
		
		setinverse = function(p = matrix()) { ## takes its argument and sets it as an inverse
		c <<- p 
		}

		getinverse = function() {c}		## prints inverse

		list(set = set, get = get, 
setinverse = setinverse, getinverse = getinverse)

}


## This function tests if the inverse of the function has already been set or
## computed. If not, it computes the inverse of a matrix and sets it as its 
## inverse.

cacheSolve <- function(x, ...) {		## the function takes as an argument an object that has been created by the first function (it is not a matrix!)
		
		inverse = x$getinverse()	## in "inverse" object the inverse of the matrix is printed	
		
		if(!is.null(inverse)) {		## if the inverse takes other value than NULL (has already been set or computed) the function prints it
		message("getting cached data")
		{ 
		inverse 
		}
	
		} else {				## otherwise, it takes a matrix "x"
		data = x$get()			## computes its inverse (object "b"), sets result as inverse (nrow(b) and nrow(c) are needed
		b = solve(data)			## to ensure that the exact inverse of matrix "x" is printed instead of some random matrix with e.g. 4 rows and 1 col)	
		x$setinverse(b, nrow(b), ncol(b))	
		x$getinverse()			## then (see below) 

        ## Return a matrix that is the inverse of 'x'
}
}