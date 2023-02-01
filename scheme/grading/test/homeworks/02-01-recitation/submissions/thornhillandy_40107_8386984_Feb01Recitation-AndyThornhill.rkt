;; Helper functions
(define member?
  (lambda (item ls)
    (if (null? ls)
        #f
        (if (equal? (car ls) item)
            #t
            (member? item (cdr ls))))))
;; End Helper functions



;; (subset? '(1 2 3) '(2 3 4 5)) => #f
;; (subset? '(2 3) '(3 2 1)) => #t
;; (subset? '() '(1 2 3) => #t
;; #t if ls2 has all elements of ls1
(define subset?
  (lambda (ls1 ls2)
    (if (null? ls1)
        #t
        (if (not (member? (car ls1) ls2))
            #f
            (subset? (cdr ls1) ls2)))))
        
        

;; (set-equals? '(1 2 3) '(1 2 3 4) ==> #f
;; (set-equals? '(1 2 3) '(3 1 2) ==> #t
;; (set-equals? '() '(1 2 3) ==> #f
;; #t if ls1 and ls2 contain same elements
(define set-equals?
  (lambda (ls1 ls2)
    (if (null? ls1)
        (if (null? ls2)
        #t #f)
        ((if (member? (car ls1) ls2)
            (set-equals? (cdr ls1) ls2)
            #f)
        (if (member? (car ls2) ls1)
            (set-equals? ls1 (cdr ls2))
            #f)))))