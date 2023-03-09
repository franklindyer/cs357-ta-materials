(define avg-helper
  (lambda (ls c s)
    (if (null? ls)
	(/ s c)
	(avg-helper
	 (cdr ls)
	 (+ c 1)
	 (+ s (car ls))))))

(define avg
  (lambda (ls)
    (avg-helper ls 0 0)))

(define swap
  (lambda (x y ls)
    (if (null? ls)
	'()
	(if (pair? (car ls))
	    (cons (swap x y (car ls)) (swap x y (cdr ls)))
	    (if (equal? x (car ls))
		(cons y (swap x y (cdr ls)))
		(if (equal? y (car ls))
		    (cons x (swap x y (cdr ls)))
		    (cons (car ls) (swap x y (cdr ls)))))))))

(swap 1 2 '(1 2 3 1 2))
(swap 'foo 'bar '(foo ((bar)) foo))
