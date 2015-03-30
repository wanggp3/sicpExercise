(define (last-pair lst)
	(if (= (length lst) 1)
		lst
		(last-pair (cdr lst))))
