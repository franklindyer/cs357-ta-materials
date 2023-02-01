(define member?
  (lambda (x ls)
    ((if (null? ls) '() #f)
     (if (equal? x (car ls)) #t (member? (cdr ls))))))

(define subset?
  (lambda (set1 set2)
    (if (member? (car set1) set2)
	(subset? (cdr set1) set2)
	#f)))

	
(define set-equals?
  (lambda (set1 set2)
    (cond
     [(member? (car set1) (set2))
    
