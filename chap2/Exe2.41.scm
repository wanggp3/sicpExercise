
(define (unique-triple n)
	(flatmap (lambda (i)
				(map (lambda (j)
						(cons i j))
					(unique-pairs (- i 1))))
			 (enumerate-interval 1 n)))

(define (triple-sum-equal? sum triple)
	(= sum (+ (car triple)
			  (cadr triple)
			  (caddr triple))))

(define (solve sum triple)
	(filter (lambda (T)
				(triple-sum-equal? sum T)) triple))
