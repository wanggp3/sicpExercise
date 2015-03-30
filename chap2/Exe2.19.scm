
(define (first-demonination coin-values)
	(car coin-values))

(define (except-first-demoninatio coin-values)
	(cdr coin-values))

(define (no-more? coin-values)
	(null? coin-values))

(define (cc amount coin-values)
	(cond ((= amount 0) 1)
		  ((or (< amount 0) (no-more? coin-values)) 0)
		  (else	(+ (cc amount (except-first-demoninatio coin-values))
				   (cc (- amount (first-demonination coin-values)) coin-values)))))
