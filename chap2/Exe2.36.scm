
(define (car-n seq)
	(map car seq))

(define (cdr-n seq)
	(map cdr seqs))

(define (accumulate-n op init seq)
	(if (null? (car seq))
		'()
		(cons (accumulate op init (car-n seq))
			  (accumulate-n op init (cdr-n seq)))))
