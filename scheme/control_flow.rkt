#lang racket

(define x '(begin (display "x evaluated\n") #f))
(define y '(begin (display "y evaluated\n") #f))
(define z '(begin (display "z evaluated\n") #t))

(define btm '(eval btm))

'(and x y)
'(and (eval x) (eval y))
'(and (eval z) (eval x))
'(and (eval z) (eval z) (eval x) (eval z))

(define (comp-list-1 l1 l2)
        (cond ((empty? l1) (empty? l2))
	      ((empty? l2) #f)
              (else (and (eqv? (eval (car l1)) (eval (car l2)))
                         (comp-list-1 (cdr l1) (cdr l2))))))

'(comp-list-1 '(1 2 3) '(1 2 3))
'(comp-list-1 '(1 2 3) '(1 2 3 4))
'(comp-list-1 '(x y z) '(y x z))
'(comp-list-1 '((eval x) (eval y) (eval z)) '((eval y) (eval x) (eval z)))
'(comp-list-1 '((eval x) (eval btm)) '((eval y) (eval btm)))
'(comp-list-1 '((eval x) (eval btm)) '((eval z) (eval btm)))

(define (comp-list-2 l1 l2)
	(cond ((empty? l1) (empty? l2))
	      ((empty? l2) #f)
	      (else (and (comp-list-2 (cdr l1) (cdr l2))
	      	    	 (eqv? (eval (car l1)) (eval (car l2)))))))