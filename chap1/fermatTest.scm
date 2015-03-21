
(define (suqare x)
	(* x x))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp) 
		   (remainder (square (expmod base (/ exp 2) m)) m))
		  (else
			(remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermatTest n)
	(define (tryIt a)
		(= (expmod a n n) a))
	(tryIt (+ 1 (random (- n 1)))))

(define (isPrime? n times)
	(cond ((= times 0) true)
		  ((fermatTest n) (isPrime? n (- times 1)))
		  (else false)))
