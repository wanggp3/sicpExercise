(define (double x)
	(+ x x))

(define (halve n)
	(/ n 2))

(define (fastMulti a b)
	(cond ((= b 0) 0)
		  ((even? b) (double (fastMulti a (halve b))))
		  (else (+ a (fastMulti a (- b 1))))))


