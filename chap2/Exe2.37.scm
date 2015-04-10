

(define (dot-product v w)
	(accmulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map (lambda (row) (dot-product row v))
	     m))

(define (transpose mat)
	(accumulate-n cons
				  '()
				  mat))
				  

(define (matrix-*-matrix m n)
	(let ((nn (transpose n)))
		(map (lambda (col-of-m)
				(matrix-*-vector nn col-of-m))
		     m)))
