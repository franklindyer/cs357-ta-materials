
(define x 5)

(define member?
    (lambda(x ls)
        (if (null? ls) #f (or (equal? x (car ls)) (member? x (cdr ls))))
    )
)

;; (set-insert 5 '(1 2 3)) => '(1 2 3 5)
;; (set-insert 5 '(1 2 3 5)) => '(1 2 3 5)
(define set-insert
    (lambda(x s)
        (if (member? x s) s (cons x s))
    )
)

(set-insert 5 '(1 2 3))
(set-insert 5 '(1 2 5))

(define union
    (lambda (s1 s2)
        (if 
        (null? s1) 
        s2
        (union (cdr s1) (set-insert (car s1) s2)))
    )
)

(union '(27 28 29) '(2 3 4))

;; (contains s1 s2) should return #t if s1 is contained in s2
;; and return #f if s1 is not contained in s2
(define contains?
    (lambda (s1 s2)
        (if (null? s1) #t ())
    )
)

;; Checks if two sets are the same.
;; Two sets are equal if they contain each other.
;; (set-equals '(2 3 4) '(2 3 5)) => #f
(define set-equals
    (lambda (s1 s2)
        (if ())
    )
)
