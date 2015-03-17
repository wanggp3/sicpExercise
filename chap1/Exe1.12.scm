;;; recursize
(define (pascal x y)
	(cond ((< x y) (error "illegal x and y"))
		  ((or (= x y) (= y 0)) 1)
		  (else (+ (pascal (- x 1) (- y 1))
				   (pascal (- x 1) y)))))

;;; iter

