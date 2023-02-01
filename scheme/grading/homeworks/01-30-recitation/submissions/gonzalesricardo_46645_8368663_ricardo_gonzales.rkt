;;Rewrite member? function
(define member?
  (lambda (item ls)
    (cond
      ((null? ls) #f)
      (else (or (equal? (car ls) item)
                (member? item (cdr ls)))))))

;; (set-insert 5 '(1 2 3 )) => '(1 2 3 5 )
;; (set-insert 5 '(1 2 3 4 5)) => '( 1 2 3 4 5)
(define set-insert
  (lambda (x s)
    (if (member? x s) s (cons x s))
    )
  )
;; (union '(1 2 3 4) '(2 3 4)) => '(1 2 3 4) / '(2 3 4 1) / '(3 2 4 1)
(define union
  (lambda (s1 s2)
    (if (null? s1) s2
        (union (cdr s1)(set-insert (car s1 ) s2)))))
;; (union '(28 28 29) '(2 3 4))
;; (union '(28 29) (set-insert 29 '(2 3 4)))
;; (union '(28 29) '(29 2 3 4))
;; (union '(29) (set-insert 28 '(29 2 3 4))

;; 1. contains? checks if the first is in the second set
;; (contains? s1 s2) should vie #t if s1 is contained in s2
;; and #f is s1 is not contained? in s2
;; (contains? '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '(3 2 1 200)) => #t
(define contains?
  (lambda (s1 s2)
    (cond
      ((null? s1) #t)
      (contains? s1 (car s2) #f))))
;; 2. set-equals?
;; Checks if two set are the same. have  the same elements.
;; (set-equals '(1 2 3) '(2 3 1)) => #t
;; (set-equals '(2 3 4) '(2 3 5)) => #f
(define set-equals
  (lambda (s1 s2)
    (cond
  ((null? s2 '())
  (else)))))