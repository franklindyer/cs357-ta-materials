;; ls1 is the subset to be looked for ls2 is the list
(define subset?
  (lambda (ls1 ls2)
    (cond
     ((null? ls2) #f)
     ((equal? (car ls2) ls1) #t)
     (else (subset? ls1 (cdr ls2))))))
