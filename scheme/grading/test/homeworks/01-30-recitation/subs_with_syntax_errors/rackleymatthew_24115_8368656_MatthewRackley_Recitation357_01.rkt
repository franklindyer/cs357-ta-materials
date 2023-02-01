#lang Racket

(define x 5)

;; member?, length, odds, evens, merge, delete

;;We'll represent sets as lists with non-repeated elements

;;Rewrite member? function

(define member?
    (lambda (x ls)
        (if (null? ls) #f (or (equal? x (car ls)) (member? x (cdr ls))))
    )
)

;; (set-insert 5 '(1 2 3)) => (1 2 3 5)
;; (set-insert 5 '(1 2 3 4 5)) = '(1 2 3 4 5)
(define set-insert
    (lambda (x s)
        (if (member? x s) s (cons x s))
    )
)


;(set-insert 5 '(1 2 3))
;(set-insert 5 '(1 2 3 4 5))

;; (union '(1 2 3) '(2 3 4)) => '(1 2 3 4)
(define union
    (lambda (s1 s2)
        (if 
            (null? s1) s2 
            (union (cdr s1) (set-insert (car s1) s2))
        )
    )
)

;(union '(27 28 29) '(2 3 4))

;; 1. Write a function called 'contains?' if every element of the first set is in the second.
;; (contains? s1 s2) should give #t if s1 is contained in s2 and #f if is not ALL contained.

(define contains?
    (lambda (s1 s2)
        (if
            (null? s1) #t
            (if
                (member? (car s1) s2) #t
                #f
            )
        )
    )
)

(contains? '(1 2 3) '(2 3 4 5 6))


;; 2. set-equals?
;; Checks if two sets are the same.
;; (set-equals '(1 2 3) '(2 3 1)) => #t
;; (set-equals '(2 3 4) '(2 3 5)) => #f

;;This will use contains?
