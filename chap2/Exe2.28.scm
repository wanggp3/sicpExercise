(define (fringe tree)
	(cond ((null? tree) tree)
		  ((not (pair? tree)) (list tree))
		  (else (append (fringe (car tree))
						(fringe (cadr tree))))))
