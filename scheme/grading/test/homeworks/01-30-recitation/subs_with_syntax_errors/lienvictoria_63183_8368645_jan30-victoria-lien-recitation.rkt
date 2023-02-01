#lang racket

(define member?
  (lambda (x ls)
    (if (null? ls)
        #f
        (or (equal? x (car ls)) (member? x (cdr ls))))))

;; (set-insert 5 '(1 2 3)) => '(1 2 3 5) / '(5 1 2 3)
;; (set-insert 5 '(1 2 3 4 5)) => '(1 2 3 4 5)
(define set-insert
  (lambda (x s)
    (if (member? x s)
        s
        (cons x s))))

;; (union '(1 2 3) '(2 3 4)) => '(1 2 3 4) / '(2 3 4 1)/ '(3 2 4 1)
(define union
  (lambda (s1 s2)
    (if (null? s1)
        s2
        (union (cdr s1) (set-insert (car s1) s2)))))

;; 1. contains?
;; (contains s1 s2) should give #t if s1 is contained in s2
;; and false if s1 is not contained in s2
;; (contains? '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '(3 2 1 200)) => #t
;; (contains? '(1 2 3 4) '(1 2 3)) => #f
;; (contains '(1 2 3 4) '(4 3 2 1)) => #t
;; (contains? '() '(1 2 3)) => #t
;; (contains '() '()) => #t
(define contains?
  (lambda (s1 s2)
    (if (null? s1)
        #t
        (not (member (car s1) s2) #f)
        ()
        

;; 2. set-equals?
;; checks if two sets are the same
;; (set-equals '(1 2 3) '(2 3 1)) => #t
;; (set-equals '(2 3 4) '(2 3 5)) => #f
(define set-equals?
  (lambda (s1 s2)
    (
    