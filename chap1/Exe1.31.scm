(define (dec x)
	(- x 1))

(define (inc x)
	(+ x 1))

(define (f x)
	(* (/ (dec x) x)
	   (/ (inc x) x)))

(define (plus-2 x)
	(+ x 2.0))

(define (product term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (+ a 1)
				  (* (term a) result))))

	(iter a 1))

(define (pi n)
	(exact->inexact
		(* 4
			(product f 3 plus-2 n))))
