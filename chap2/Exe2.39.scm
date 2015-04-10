
(define (fold-left op initial seq)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest))
							 (cdr rest))))
	(iter initial seq))

(define (reverse seq)
	(accmulate (lambda (x y) (cons y x) '() seq)))

(define (reverse seq)
	(fold-left (lambda (x y) (append x (list y)) '() seq)))
