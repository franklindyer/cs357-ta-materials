(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      ((member? (car set1) set2) (subset? (cdr set1) set2))
      (else #f))))
  

(define set-equals?
    (lambda (set1 set2)
    (cond
      (and (subset? set1 set2) (subset? set1 set2)))))