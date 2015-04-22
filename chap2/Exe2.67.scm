
(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
	(if (leaf? tree)
		(list (symbol-leaf tree))
		(caddr tree)))
(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)))

(define (make-code-tree left right)
	(list left
		  right
		  (append (symbols left) (symbols right))
		  (+ (weight left) (weight right))))

(define (choose-branch bit cur-node)
	(cond ((= bit 0) (left-branch cur-node))
	      ((= bit 1) (right-branch cur-node))
		  (else (error "bad bit ~0/1" bit))))

(define (decode bits tree)
	(define (decode-1 bits cur-node)
		(if (null? bits)
			'()
			(let ((next-node (choose-branch (car bits) cur-node)))
			   (if (leaf? next-node)
				   (cons (symbol-leaf next-node)
						 (decode-1 (cdr bits) tree))
				   (decode-1 (cdr bits) next-node)))))
	(decode-1 bits tree))


(define (adjoin-set x set)
	(cond ((null? set) (list x))
		  ((< (weight x) (weight (car set))) (cons x set))
		  (else (cons (car set) 
				      (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
	(if (null? pairs)
		'()
		(let ((pair (car pairs)))
			(adjoin-set (make-leaf (car pair)
								   (cadr pair))
			            (make-leaf-set (cdr pairs))))))

(define tree (make-code-tree (make-leaf 'A 4)
							 (make-code-tree 
							   (make-leaf 'B 2)
							   (make-code-tree
								 (make-leaf 'D 1)
								 (make-leaf 'C 1)))))
(define msg '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(decode msg tree)
