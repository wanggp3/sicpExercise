
(define (list-equal? x y)
	(cond ((and (null? x) (null? y)) #t)
		  ((or (null? x) (null? y)) #f)
		  (else (and (equal? (car x) (car y))
				     (equal? (cdr x) (cdr y))))))



(define (equal? x y)
	(cond ((and (symbol? x) (symbol? y)) 
				(eq? x y))
		  ((and (list? x) (list? y))
				(list-equal? x y))
		  (else (error "wrong type compare"))))
