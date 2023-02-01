#lang racket

(define x 5)

(define member?
  (lambda (x ls)
    (if
     (null? ls)
        #f
        (or (equal? x (car ls)) (member? x (cdr ls))))
    ))

;;(set-insert 5 '(1 2 3) => '(1 2 3 4 5) / '(5 1 2 3)
(define set-insert
  (lambda (x s)
    (if (member? x s) s (cons x s))
    )
  )

;; (union '(1 2 3) '(2 3 4)) => '(1 2 3 4) / '(3 2 4 1)

(define union
  (lambda (s1 s2)
    (if
     (null? s1)
        s2
        (union (cdr s1) (set-insert (car s1) s2)))))

;; (union '(27 28 29) '(2 3 4))
;; (union '(28 29) (set-insert 29 '(2 3 4))
;; (union '(28 29) '(29 2 3 4))
;; (union '(29) (set-insert 28 '(29 2 3 4))

;; Actual Lab Assignment from here below

;; 1. contains?
;; (contains s1 s2) should give #t if s1 is containd in s2
;; and #f is s1 is not contained in s2(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '( 2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '(3 2 1 200)) => #t

(define contains?
  (lambda (s1 s2)
    (if (null? s1)
    #t
    (or (equal? s1 (cdr s2))))))
  

;; 2. set-equals?
;; checks if two sets are the same
;; (set-equals '(1 2 3) '(2 3 1)) => #t
;; (set-equals '(2 3 4) '(2 3 5)) => #f
