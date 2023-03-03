#lang racket

(define curry (lambda (f) (lambda (x) (lambda (y) (f x y)))))
(define uncurry (lambda (f) (lambda (x y) ((f x) y))))

(define +c (curry +))

(define add2 (+c 2))
(add2 5)
((+c 2) 5)

;; Describe how this function will behave?
(compose (+c 3) (+c 5))

(define fst (lambda (x y) x))
(define snd (lambda (x y) y))

;; Describe what this function does?
(define const (curry fst))

;; Describe this function?
;; Can they notice that it's the same as (const identity)?
(define foo (curry snd))

;; Describe what this does?
(define 2nd-of-3 (const const))
(define 3rd-of-4 (const (const const)))

(define swap (lambda (f) (lambda (x y) (f y x))))

(define swapc (lambda (f) (lambda (y) (lambda (x) ((f x) y)))))

;; Let's play with the expt procedure in this context
;; (expt a b) gives a^b
(define expc (curry expt))

(define power2 (expc 2))
(define power3 (expc 3))

(define square ((swapc expc) 2))
(define cube ((swapc expc) 3))

;; Composed curry function
(define compc (curry compose))

;; What does this function do?
(define comp-sqr (compc square))
(define comp-cube (compc cube))
(define comp-sqr-cube (compose comp-sqr comp-cube))

(define f1 (comp-sqr square))
(define f2 (comp-cube square))
(define f3 (comp-sqr cube))
(define f4 (comp-sqr-cube square))

;; LAB EXERCISE:
;; 1. Use only "const" and "swapc" (and parentheses) to write a 4th-of-7 function
;; 2. Use only "compc" to write a "comp3c" function that composes 3 functions

(define 4th-of-7 (const (const (const (swapc (const (swapc (const const))))))))

(define comp3 ((compc (compc compc)) compc))
