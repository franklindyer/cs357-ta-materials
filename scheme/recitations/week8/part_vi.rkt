(define avg-helper
  (lambda (ls count sum)
    (if (null? ls)
      (/ sum count)
      (avg-help (cdr ls)
		(+ count 1)
		(+ sum (car ls))))))

(define avg
  (lambda (arguments)
    (avg-helper ls 0 0)))

(define swap
  (lambda (x y ls)
    (if (null? ls)
      '()
      (if (pair? (car ls))
          (cons (swap x y (car ls))
		(swap x y (cdr ls)))
        (if (equal? (car ls) x)
	    (cons
	     y
	     (swap x y (cdr ls)))
	    (if (equal? (car ls) y)
		(cons
		 x
		 (swap x y (cdr ls)))
		(cons
		 (car ls)
		 (swap x y (cdr ls)))))))))

(swap 1 2 '(1 2 3 1 2))
(swap 'foo 'bar '(foo ((bar)) foo))
