(define (sum term a next b)
	(if (> a b) 
		0
		(+ (term a)
		   (sum term (next a) next b))))

(define (simpson f a b n)

	(define h(/ (- b a) n))

	(define (y k)
		(f (+ a (* k h))))

	(define (multier k)
	 (cond ((or (= k 0) (= k n))
			 1)
		   ((even? k) 
			 2)
		   (else 
			 4)))

	(define (term k)
		(* (multier k) (y k)))

	(define (next k)
		(+ k 1))

	(if (odd? n)
		(error "n must be even")
		(* (/ h 3)
		   (sum term (exact->inexact 0) next n))))
