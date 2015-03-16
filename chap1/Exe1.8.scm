
(define (improve guess x)
	(/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (goodEnough? guess x)
	(< (abs (- (* guess guess guess) x)) 0.001))

(define (cubeRootIter guess x)
	(if (goodEnough? guess x)
		guess
		(cubeRootIter (improve guess x) x)))

(define (cubeRoot x ) 
	(cubeRootIter 1.0 x))

