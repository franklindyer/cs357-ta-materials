#lang racket

(define member?
  (lamda (x ls)
    (if (null? ls) #f (or (equal? x (car ls)) (member? x (cdr ls))))
  )
)

(define set-insert
  (lamda (x s)
    (if (member? x s) s (cons x s))
  )
)

(define union
    (lamda (s1 s2)
        (if (null? s1) s2 (union (set-insert (car s1) s2) (cdr s1))
    )
)

;; 1. contains?
(define contains?
    (lamda (s1 s2)
        (if (member (car s1) s2) (contains (cdr s1) s2) #f)
    )
)

;; 2. set-equals?
(define set-equals?
    (lamda (s1 s2)
        (if (and (contains? s1 s2) (contains? s2 s1)) #t #f)
    )
)