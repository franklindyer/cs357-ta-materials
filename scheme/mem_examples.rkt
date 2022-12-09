#lang racket

(define x '(2))
(define y1 (cons 1 x))
(define y2 '(1 2))
(equal? y1 y2)
(eqv? y1 y2)

(define (f x) (cons 0 f))
(define a '(1 2 3))
(define b a)
(eqv? a b)
(eqv? (f a) (f b))
(equal? a b)
(equal? a b)

(define c '(1 2 3))
(define (g x) (eqv? x c))
(equal? c '(1 2 3))
(g c)
(g '(1 2 3))

(define (listify-cum acc t elem-crit)
	(cond ((elem-crit t) (cons t acc))
	      ((pair? t) (listify-cum (listify-cum acc (car t) elem-crit) (cdr t) elem-crit))
	      (else acc)))

(define penultimate?
	(lambda (t)
	     (and (pair? t) (not
	         (or (pair? (car t)) (pair? (cdr t)))
	))))

