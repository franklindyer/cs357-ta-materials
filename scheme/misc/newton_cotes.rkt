#lang racket

(define (weighted-eval nodes-weights f)
	(foldr (lambda (nw acc) (+ acc (* (cdr nw) (f (car nw)))))
	       0 nodes-weights))

(define (adjust-weighted-eval nodes-weights f a b)
	(weighted-eval nodes-weights (lambda (x) (f (+ a (* x (- b a)))))))

(define (desc n)
	(if (= n 0)
	    '()
	    (cons (- n 1) (desc (- n 1)))))

(define (mince-interval a b n)
	(map (lambda (x) (- b (* (- b a) (/ x (- n 1))))) (desc n)))

(define (newton-cotes nodes-weights)
	(letrec ((cum-interval-sum
		(lambda (f nodes acc)
			(if (= (length nodes) 1)
			    acc
			    (cum-interval-sum f
			    	(cdr nodes)
				(+ acc
				   (adjust-weighted-eval
					nodes-weights
					f
					(car nodes)
					(cadr nodes))))))))
	     (lambda (f a b n)
	     	     (* (/ (- b a) (- n 1))
		     	(cum-interval-sum f (mince-interval a b n) 0)))))

(define (f x) (+ (* x x x x x) (* 3 x)))
(define nc2 '((0 . 0.5) (1 . 0.5)))
(define NC2 (newton-cotes nc2))
(define nc3 '((0 . #i1/6) (1/2 . #i4/6) (1 . #i1/6))
(define NC3 (newton-cotes nc3))