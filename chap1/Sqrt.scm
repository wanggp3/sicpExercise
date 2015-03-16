
(define (average x y)
	(/ (+ x y) 2))


(define (improve guess x)
	(average guess (/ x guess)))

(define (good-enough? guess x)
	(< (abs (- (* guess guess) x)) 0.001))
	
(define (Sqrt guess x)
(if (good-enough? guess x)
   	guess
	(Sqrt (improve guess x) x)))

(define (mysqrt x)
	(Sqrt 1.0 x))
