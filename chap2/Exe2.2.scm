

(define (makeSeg spoint epoint)
	( cons spoint epoint))

(define (startPointOfSeg seg)
	(car seg))

(define (endPointOfseg seg)
	(cdr seg))

(define (makePoint x y)
	(cons x y))

(define (getX point)
	(car point))

(define (getY point)
	(cdr point))

(define (getMidPointFromSeg seg)
	(define (average x y)
		(/ (+ x y) 2.0))
	(let ((start (startPointOfSeg seg))
		  (end (endPointOfseg seg)))
		(makePoint (average (getX start)
							(getX end))
				   (average (getY start)
							(getY end)))))

(define (printPoint point)
	(newline)
	(display "(")
	(display (getX point))
	(display ",")
	(display (getY point))
	(display ")"))

