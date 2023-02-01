#lang racket

(define x 5)

;; member?, length, odds, evens, merge, delete

;; We'll represent sets as lists with non-repeated elements

;; (set-insert 5 '(1 2 3)) => '(1 2 3 4 5)

(define member?
  (lambda (x ls)
    (if 
     (null? ls)
     #f
     (or (equal? x (car ls)) (member? x (cdr ls))))))


(define set-insert
  (lambda (x s)
    (if (member? x s) s (cons x s))))

;; (union '(1 2 3) '(2 3 4)
(define union
  (lambda (s1 s2)
    (if
     (null? s1)
     s2
     (union (cdr s1) (set-insert (car s1) s2)))))

;; 1. contains?
;; (contains s1 s2) should give #t if s1 is contained
;;   in s2
;;   and #f if s1 is not contained in s2
;; (contains? '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(2 3 4) '(3 2 1 200)) => #t

(define contains?
  (lambda (s1 s2)
    (if
     (null? s1)
     #t
     (and (contains? (member? (car s1 (s2))))))))


;; 2. set-equals?
;; Checks if two sets are the same (have same elements)
;; (set-equals '(1 2 3) '(2 3 1)) => #t
;; (set-equals '(2 3 4) '(2 3 5)) => #f

(define set-equals?
  (lambda (s1 s2)
    (if
     (null? s1)
     #f
     (and (contains? s1 s2) (contains? s2 s1)))))
