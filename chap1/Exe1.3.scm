(define (square x)
    (+ x x))

(define (larger x y)
	(if (> x y)
	    x
		y))

(define (smaller x y)
	(if (> x y)
		y
		x))

(define (sumOfSquare x y)
	(+ (square x)
	   (square y)))

(define (largerSumOfSquare2In3 x y z)
	(sumOfSquare (larger x y) 
	(larger z (smaller x y))))


		
