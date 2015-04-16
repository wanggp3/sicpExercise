

(define (element-of-set? x set)
	(cond ((null? set) false)
		  ((equal? x (car set)) true)
		  (else (element-of-set? x (cdr set)))))


(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cons x set)))


(define (intersection-set s1 s2)
	(cond ((or (null? s1) (null? s2)) '())
		  ((element-of-set? (car s1) s2)
				(cons (car s1) (intersection-set (cdr s1) s2)))
		  (else 
			(intersection-set (cdr s1) s2))))

(define (union-set s1 s2)
	(if (null? s1) 
		s2
		(adjoin-set (car s1) (union-set (cdr s1) s2))))
