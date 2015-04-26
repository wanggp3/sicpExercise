
(define (encode-symbol symbol tree)
	(cond ((leaf? tree)
		   '())
		  ((in-tree? symbol (left-branch tree))
		   (cons 0 (encode-symbol symbol (right-branch tree))))
		  ((in-tree? symbol (right-branch tree))
		   (cons 1 (encode-symbol symbol (left-branch tree))))
		  (else (error "the symbol isn't in this tre " symbol))))

(define (in-tree? symbol tree)
	(if (leaf? tree)
		(eq? symbol (symbol-tree tree))
		(or (symbol (left-branch tree)) (symbol (right-branch)))))
