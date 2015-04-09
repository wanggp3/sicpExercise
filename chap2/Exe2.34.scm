(define (horner-eval x coefficient-seq)
	(accumulate (lambda (this-coeff higher-terms)
					(+ this-coeff (* x higher-terms)))
			    0
				coefficient-seq))
