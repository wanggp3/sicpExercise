

(define (filter predicate seq)
	(cond ((null? seq) '())
		  ((predicate (car seq)) 
				(cons (car seq) (filter predicate (cdr seq))))
		  (else (filter predicate (cdr seq)))))

(define (ok x) (= 0 (remainder x 4)))

