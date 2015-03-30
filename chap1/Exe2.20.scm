
(define (same-parity x . y)
	(filter (if (even? x)
				even?
				odd?)
			(cons x y)))
