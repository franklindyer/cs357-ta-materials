

(define member?
  (lambda (x ls)
    (if (null? ls)
        #f
        (or (equal? x (car ls)) (member? x (cdr ls))))))

;; 1. contains?
;; (contains? s1 s2) should give #t if s1 is contained within s2 and #f if s1 is not contained in s2
;; (contains? '(1 2 3) '(1 2 3)) => #t
;; I couldn't think of the recursion cases so I just returned #f so it would compile
(define contains?
  (lambda (s1 s2)
    (if (null? s1)
        s1
        #f
    )
  )
)
        

;; 2. set-equals?
;; Checks if two sets are the same i.e have the same element