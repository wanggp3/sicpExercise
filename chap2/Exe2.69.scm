
(define (generate-huffman-tree pairs)
	(successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-set)	
	(cond ((= 0 (length ordered-set)) '())
		  ((= 1 (length ordered-set)) (car ordered-set))
		  (else (let ((add-node (make-code-tree (car ordered-set)
												(cdar ordered-set)))
					  (remaind-set (cddr ordered-set)))
				 (successive-merge (adjoin-set add-node remaind-set))))))
