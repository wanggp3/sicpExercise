
(define (cons x y)
	(define (dispatch m)
		(cond ((= m 0) x)
			  ((= m 1) y)
			  (else (error "argument not 0|1 " m))))
	dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))
