#lang racket
;; Jingru Dou
;; CS357
;; lab 1
;; at the end of document are the two questions

;; (define x 5)
;; (equal? (list '+ 2 3) '(+ 2 3))

;; member? , length, odds, evens, merge, delete

;; we'll represent sets as lists with non-repeated elements

;; Rewrote member? function
(define member?
  (lambda (x ls)
    (if
     (null? ls)
     #f
     (or (equal? x (car ls)) (member? x (cdr ls)))))) ; list is null return false, if not return true

;; (set-insert 5 '(1 2 3)) => '(1 2 3 5)
;; (set-insert 5 '(1 2 3 4 5)) => '(1 2 3 4 5)
(define set-insert
  (lambda (x s)
    (if (member? x s) s (cons x s))))

;; (union '(1 2 3) '( 2 3 4)) => '(1 2 3 4) / '(2 3 4 1) / '(3 2 4 1)
(define union
  (lambda (s1 s2)
    (if
     (null? s1)
      s2
      (union (cdr s1) (set-insert (car s1) s2)))))

;; (union '(27 28 29) '(2 3 4))
;; (union '(28 29) (set-insert 29 '(2 3 4))
;; (union '(28 29) '(29 2 3 4))
;; (union '(29) (set-insert 28 '(29 2 3 4)))

;; 1. write a function called contains?, to check if every element of the first is also in second set
;; (contains s1 s2) should give #t if s1 is contained in s2
;; and #f is s1 is not contained in s2
;; (contains '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains '(1 2 3) '(3 2 1 200)) => #t

(define contains
  (lambda (s1 s2)
    (if (member? s1 s2) #t (cons s1 s2))))
  
;; 2. set-equals?
;; checks if two sets are the same, have the same elements
;; e.g. (set-equals '(1 2 3) '(3 2 1)) => #t
;; e.g. (set-equals '(2 3 4) '(2 3 5)) => #f
       
(define set-equals
  (lambda (s1 s2)
    (if
     (null? s1)
      s2
      (union (cdr s1) (set-insert (car s1) s2)))))
