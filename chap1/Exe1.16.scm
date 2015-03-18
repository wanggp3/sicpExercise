(define (fuck a n ans)
	(cond ((= n 0) ans)
		  ((even? n) (fuck (* a a) (/ n 2) ans))
		  (else (fuck (* a a) (/ (- n 1) 2) (* ans a)))))

(define (fastExp a n)
	(fuck a n 1))

