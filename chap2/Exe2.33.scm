(define (map p seq)
	(accumulate  (lambda (x y) (cons (p x) y))
		'()
		seq))

(define (append seq1 seq2)
	(accumulate cons seq2 seq1))


(define (length seq)
	(accumulate (lambda (x y) (+ 1 y))
		        0
				seq))
