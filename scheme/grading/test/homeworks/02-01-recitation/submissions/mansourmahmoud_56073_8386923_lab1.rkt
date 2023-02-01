(define member?
  (lambda (x ls)
    (if null? ls)
    #f
    (if
     (equal? x (car ls))
	     #t
	     (member? x (cdr ls)))
     )
    )
  


(define subset?
  (lambda (set1 set2)
    (or (null? set1)
	(and (member? (car set1) set2)
	     (subset (cdr set1) set2)))))


(define set-equals?)
(lambda (set1 set2)
  (
