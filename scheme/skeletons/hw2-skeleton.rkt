#lang racket

;; CS 357 Spring 2023, Homework 2
;; Due Wed, Feb 15
;; [INSERT YOUR NAME HERE]

;; Problem 4.4
;; (deepen-1 '(a b c d)) ==> '((a) (b) (c) (d))
;; (deepen-1 '()) ==> '()
(define deepen-1 0)

;; Problem 4.6
;; (insert-left-all 'z 'a '(a ((b a) ((a (c)))))) ==> '(z a ((b z a) ((z a (c)))))
;; (insert-left-all 'z 'a '()) ==> '()
(define insert-left-all 0)

;; Problem 4.10
;; (leftmost '((a b) (c (d e))) ==> 'a
;; (leftmost '(() a)) ==> '()
(define leftmost 0)

;; Problem 4.11
;; (rightmost '((((((b (c)))))))) ==> 'c
;; (rightmost '(a ())) ==> '()
(define rightmost 0)

;; Problem 4.18
;; (length-it '(1 2 3 4 (5 6 7 8))) ==> 5
;; (length-it '()) ==> 0
(define length-it 0)

;; Problem 4.19
;; (mk-asc-list-of-ints 5) ==> '(1 2 3 4 5)
;; (mk-desc-list-of-ints 5) ==> '(5 4 3 2 1)
(define mk-asc-list-of-ints 0)
(define mk-desc-list-of-ints 0)

;; Problem 4.20
;; (occurs 'a '(a b a c a d)) ==> 3
;; (occurs 'a '(b c a (b a) c a)) ==> 2
(define occurs 0)
(define occurs-it 0)

;; Infix calculator for + - * /
;; (calculator '(1 + (2 * ((3 + 4) - 5)))) ==> 5
;; (calculator '(5 / (5 / ((5 / 5) / 5)))) ==> 1/5
(define calculator 0)

;; Infix-to-prefix expression converter
;; (infix->prefix '(1 + (2 * ((3 + 4) - 5)))) ==> '(+ 1 (* 2 (- (+ 3 4) 5)))
;; (infix->prefix '(5 / (5 / ((5 / 5) / 5)))) ==> '(/ 5 (/ 5 (/ (/ 5 5) 5)))
(define infix->prefix 0)

;; Iota-iota function using letrec and tail recursion
;; (iota-iota 1) ==> '((1 . 1))
;; (iota-iota 2) ==> '((1 . 1) (1 . 2) (2 . 1) (2 . 2))
(define iota-iota 0)

;; Convert digits to number tail-recursively
;; (digits->number '(7 6 1 5)) ==> 7615
;; (digits->number '(0)) ==> 0
(define digits->number 0)

;; Cond expression to nested if expressions
;; (cond->if ’(cond ((> x y) (- x y)) ((< x y) (- y x)) (else 0))) ==> (if (> x y) (- x y) (if (< x y) (- y x) 0))
(define cond->if 0)

;; Cosine function using letrec for helper functions
;; DO NOT use/define fact or expt!
;; (cos 0) ==> something that is approximately 1
;; (cos 1) ==> something that is approximately 0.5403
;; (cos 1.57079) ==> something that is approximately 1
(define cos 0)

