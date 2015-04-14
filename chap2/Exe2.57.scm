
;;;	(variable? e)
;;; (same-variable? v1 v2)
;;; (sum? e)
;;; (addend e)   // addend of the sum e
;;; (augend e)   // augend of the sum e
;;; (make-sum a1 a2)
;;; (product? e)
;;; (multiplier e)
;;; (multiplicand e)
;;; (make-product a1 a2)

;;;  cal the dericative of the expression with format of [ a op b ]

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))


;;;(define (make-sum a1 a2) (list '+ a1 a2))
(define (=number? exp val)
	(and (number? exp) (= exp val)))

(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2)) (+ a1 a2))
		  (else (list '+ a1 a2))))

;;;(define (make-product a1 a2) (list '* a1 a2))
(define (make-product a1 a2) 
	(cond ((or (=number? a1 0) (=number? a2 0)) 0)
		  ((=number? a1 1) a2)
		  ((=number? a2 1) a1)
		  ((and (number? a1) (number? a2)) (* a1 a2))
		  (else (list '* a1 a2))))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend x) (cadr x))

;;;(define (augend x) (caddr x))
(define (augend x)
	(cond ((null? (cdddr x)) (caddr x))
		  (else (cons '+ (cddr x)))))


(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier x) (cadr x))

;;;(define (multiplicand x) (caddr x))
(define (multiplicand x)
	(cond ((null? (cdddr x)) (caddr x))
		  (else (cons '* (cddr x)))))

(define (exponentiation? x)
	(and (pair? x) (eq? (car x) '**)))

(define (base exp)
	(cadr exp))

(define (exponent exp)
	(caddr exp))

(define (make-exponentiation base exponent)
	(cond ((= exponent 0) 1)
		  ((= exponent 1) base)
		  (else 
			(list '** base exponent))))

;;;;;;


(define (deriv exp var)
	(cond ((number? exp) 0)
		  ((variable? exp) 
					(if (same-variable? exp var) 1 0))
		  ((sum? exp) (make-sum (deriv (addend exp) var)
							    (deriv (augend exp) var)))
		  ((product? exp)
					(make-sum 
						(make-product (multiplier exp)
									  (deriv (multiplicand exp) var))
						(make-product (multiplicand exp)
									  (deriv (multiplier exp) var))))
		  ((exponentiation? exp)
					(make-product
						(make-product (exponent exp)
									  (make-exponentiation (base exp) (- (exponent exp) 1)))
						(deriv (base exp) var)))
		  (else (error "Unknown exp " exp))))
