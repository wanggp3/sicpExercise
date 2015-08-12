(define (list->tree elements)
	(car (partial-tree elements (length elements))))

(define (partial-tree elements n)
	(if (= n 0)
		(cons '() elements)
		(let ((left-size (quotient (- n 1) 2)))
		  (let ((left-result (partial-tree elements left-size)))
		    (let ((left-tree (car left-result))
				  (non-left-elements (cdr left-result))
				  (right-size (- n (+ left-size 1))))
			  (let ((cur-entry (car non-left-elements))
					(right-result (partial-tree (cdr non-left-elements) right-size)))
			    (let ((right-tree (car right-result))
					  (remaining-elements (cdr right-result)))
				  (cons (make-tree cur-entry left-tree right-tree) remaining-elements))))))))