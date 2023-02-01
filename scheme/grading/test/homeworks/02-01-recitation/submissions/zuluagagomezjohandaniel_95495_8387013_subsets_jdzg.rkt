(define member?
  (lambda (item ls)
    (cond
     ((null? ls) #f)
     (else (or (equal? (car ls) item)
	       (member? item (cdr ls)))))))

(define subset?
  (lambda (ls1 ls2)
    (cond
     ((null? ls1) #t)
     ((null? ls2) #f)
     (else (and (member? (car ls1) ls2) (subset? (cdr ls1) ls2))))))

(subset? '(1 2 3) '(2 3 4 5))
(subset? '(2 3) '(3 2 1))
(subset? '() '(1 2 3))

(define set-equals?
  (lambda (ls1 ls2)
    (and (subset? ls1 ls2) (subset? ls2 ls1))))
(set-equals? '(1 2 3) '(1 2 3 4))
(set-equals? '(1 2 3) '(3 2 1))
(set-equals? '(1 2 3) '(2 1 3))
(set-equals? '() '(1))
