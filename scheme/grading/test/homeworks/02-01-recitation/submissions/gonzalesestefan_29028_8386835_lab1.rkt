#lang racket

(define member? 
	(lambda (x lst)
		(if (null? lst)
			#f
			(if (equal? x (car lst))
				#t
				(member? x (cdr lst))
			)
		)
	)
)

(define set-insert
	(lambda (x set1)
		(if (member? x set1)
			set1
			(cons x set1)
		)
	)
)

(define union-two
	(lambda (set1 set2)
		(if (null? set1) 
			set2 
			(set-insert (car set1) (union-two (cdr set1) set2))
		)
	)
)


(define subset?
	(lambda (sub sup)
		(if (null? sub)
			#t
			(if (member? (car sub) sup)
				(subset? (cdr sub) sup)
				#f
			)
		)
	)
)


(define set-equals?
	(lambda (set1 set2)
		(and (subset? set1 set2) (subset? set2 set1))
	)
)
