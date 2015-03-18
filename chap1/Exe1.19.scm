;;;http://book.douban.com/annotation/17994049/

(define (fuck a b p q n)
	(cond ((= n 0) b)
		  ((even? n) 
			   (fuck a
					 b
					 (+ (* p p) (* q q))
					 (+ (* 2 p q) (* q q))
					 (/ n 2)))
		  (else 
			(fuck (+ (* b q) (* a q) (* a p))
				  (+ (* b p) (* a q))
				  p
				  q
				  (- n 1)))))

(define (fib n)
	(fuck 1 0 0 1 n))
