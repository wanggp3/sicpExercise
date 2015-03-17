(define (F n) ;;;recursive
	( if (< n 3)
	  n
	  (+ (F (- n 1))
		 (* 2 (F (- n 2)))
		 (* 3 (F (- n 3))))))

;;; iter
(define (fuck a b c i n)
	(if (= i n)
		a
		(fuck b
			  c
			  (+ c (* 2 b) (* 3 a))
			  (+ i 1)
			  n)))
			  

			  

(define (FF n)
	(fuck 0 1 2 0 n))


