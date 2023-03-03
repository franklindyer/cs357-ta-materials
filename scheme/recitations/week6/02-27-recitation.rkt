#lang racket

(define curry (lambda (f) (lambda (x) (lambda (y) (f x y)))))
(define uncurry (lambda (f) (lambda (x y) ((f x) y))))

(define +c (curry +))
(define my-+ (uncurry +c))

(define f1 (compose (+c 3) (+c 5)))
;; ^ this is basically the same as (+c 8)

(define fst (lambda (x y) x))
(define snd (lambda (x y) y))

(define const (curry fst))
(define f3 (const 50))

;; ((const 'a) ___) ==> 'a
;; (fst 'a ___) ==> 'a

(define f4 (curry snd))

(define f5 (const identity))

(define 2nd-of-3 (const const))
;; (f6 x) ==> const
;; ((f6 x) y) ==> (const y)
;; (((f6 x) y) z) ==> y

(define 3rd-of-4 (const 2nd-of-3))
;; (g w) ==> 2nd-of-3
;; ((((g w) x) y) z) ==> y

(define swapc (lambda (f) (lambda (y) (lambda (x) ((f x) y)))))

(define 1st-of-3 (swapc (const const)))

(define compc (curry compose))

(define comp-add1 (compc add1))

;; (expt a b) ==> a^b

(define expc (curry expt))

(define power2 (expc 2))
(define square ((swapc expc) 2))

;; 1. 4th-of-7 - curried function that takes 7 arguments and returns the 4th one
;;    Use only const, swapc
;; (((((((4th-of-7 'a) 'b) 'c) 'd) 1) 2) 3) ==> 'd

;; (define 2nd-of-3 (const const))
;; (define 1st-of-3 (swapc 2nd-of-3))

(define 6th-of-7 (const (const (const (const (const const))))))

;; 2. comp3 - curried function that takes 3 functions as (curried) arguments and composes them
;;    Use only compc
;; ((((comp3 add1) add1) add1) 5) ==> 8
;; ((((comp3 square) sub1) square) 2) ==> 9
