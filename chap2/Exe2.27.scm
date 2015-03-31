
(define (deep-reverse lst)
	(cond ((null? lst) '())
		  ((not (pair? lst)) lst)
		  (else 
			(list (deep-reverse (cadr lst))
				  (deep-reverse (car lst))))))

(define x (list (list 1 2) (list 3 4)))

(define y (list 1 2))

(define z (list 1))
