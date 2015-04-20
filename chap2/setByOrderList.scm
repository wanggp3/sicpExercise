
(define (element-of-set? x set)
	(cond ((null? set) false)
		  ((= x (car set)) true)
		  ((< x (car set)) false)
		  (else (element-of-set? x (cdr set)))))

(define (intersection-set s1 s2)
	(if (or (null? s1) (null? s2) '())
		(let ((x1 (car s1)) (x2 (car s2)))
			(cond ((= x1 x2)
				   (cons x1 (intersection-set (cdr s1) (cdr s2))))
				  ((< x1 x2)
				   (intersection-set (cdr s1) s2))
				  ((> x1 x2)
				   (intersection-set s1 (cdr s2)))))))


(define (adjoin-set x set)
	(if (null? x)
	    (list x)
		(cond ((= x (car set)) set)
			  ((< x (car set)) (cons (x set)))
			  ((> x (car set)) (cons (car set) (adjoin-set x (cdr set)))))))

(define (union-set s1 s2)
	(cond ((and (null? s1) (null? s2)) '())
		  ((null? s1) s2)
		  ((null? s2) s1)
		  (else 
			(let ((x (car s1)) (y (car s2)))
				(cond ((= x y) (cons x (union-set (cdr s1) (cdr s2))))
					  ((< x y) (cons x (union-set (cdr s1) s2)))
					  ((> x y) (cons y (union-set s1 (cdr s2)))))))))



