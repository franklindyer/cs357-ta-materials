#lang racket

(define (extend-inc-dec op)
	(lambda (x1 x2)
	  (let ((a (car x1))
	        (b (cdr x1))
		(c (car x2))
		(d (cdr x2)))
	    (cons
	      (min (op a c) (op a d) (op b c) (op b d))
	      (max (op a c) (op a d) (op b c) (op b d))))))

(define i+ (extend-inc-dec +))
(define i- (extend-inc-dec -))
(define i* (extend-inc-dec *))
(define i/ (extend-inc-dec /))

(define x '(-1 . 1))
(i+ (i* x x) x)
(i* x (i+ x '(1 . 1)))
(i- (i* (i+ x '(1/2 . 1/2)) (i+ x '(1/2 . 1/2))) '(1/4 . 1/4))
(i+ (i/ x '(1/2 . 1/2)) (i* x (i+ x '(1/2 . 1/2))))

(define (asc n)
  (if (= n 0)
    '()
    (cons 0 (map (lambda (x) (+ x 1)) (asc (- n 1))))))

(define (mince I n)
  (let
    ((a (car I))
     (b (cdr I)))
    (map
      (lambda (k)
        (cons
	  (+ a (* (/ (- b a) n) k))
	  (+ a (* (/ (- b a) n) (+ k 1)))))
      (asc n))))

(define (zip l1 l2)
	(if (or (null? l1) (null? l2))
	    '()
	    (cons
	      (cons (car l1) (cons (car l2) '()))
	      (zip (cdr l1) (cdr l2)))))

(define (minced-eval f x n)
  (let*
    ((xm (mince x n))
     (ys (map f xm)))
    (cons
      (apply min (map car ys))
      (apply max (map cdr ys)))))