#lang racket
(require "./set_utils.rkt")

(define (elem n l)
	(if (= n 0)
	    (car l)
	    (elem (- n 1) (cdr l))))

(define (next-state aut st x)
	(elem st (elem x aut)))

(define (concat-stack bw fw)
	(if (empty? bw)
	    fw
	    (concat-stack (cdr bw) (cons (car bw) fw))))

(define (poss-states aut old x)
	(foldr (lambda (st poss) (insert-set < (next-state aut st x) poss))
	       '()
	       old))

(define (poss-states-str aut old str)
	(foldr (lambda (ch poss) (poss-states aut poss ch))
	       old
	       str))

(define (list-< l1 l2)
	(cond ((empty? l2) #f)
	      ((empty? l1) #t)
	      ((< (car l1) (car l2)) #t)
	      ((> (car l1) (car l2)) #f)
	      (else (list-< (cdr l1) (cdr l2)))))

(define (is-redundant cmp prev p)
	(if (empty? prev)
	    #f
	    (or (subset cmp (cadar prev) (cadr p))
	    	(is-redundant cmp (cdr prev) p))))

(define (poss-states-track aut pr x)
	(cons (cons x (car pr))
	      (cons (poss-states aut (cadr pr) x) '())))

(define (poss-states-trans-cum aut A acc old)
	(if (= A 0)
	    (cons (poss-states-track aut old 0) acc)
	    (poss-states-trans-cum aut
				   (- A 1)
				   (cons (poss-states-track aut old A) acc)
				   old)))

(define (desc n)
	(if (= n 0)
	    '(0)
	    (cons n (desc (- n 1)))))

(define (asc n)
	(concat-stack (desc n) '()))

(define (poss-states-trans aut A old)
	(map (lambda (x) (poss-states-track aut old x)) (desc A)))

(define (poss-states-filter-cum aut A prev next)
	(if (empty? next)
	    prev
	    (poss-states-filter-cum
	    	aut
		A
		(if (is-redundant < prev (car next))
		    prev
		    (cons (car next)
		    	  (filter (lambda (pr) (not (subset < (cadar next) (cadr pr))))
			  	  prev)))
		(append (cdr next)
			(filter (lambda (x) (not (is-redundant < prev x)))
				(poss-states-trans aut A (car next)))))))

(define (find-sync-states aut A S)
	(filter (lambda x #t)
		(poss-states-filter-cum aut A '()
			(cons (cons '() (cons (asc S) '())) '()))))
			
(define my-aut
	'((1 3 0 2 5 3)
	  (1 1 3 4 2 5)))

(define my-aut-2
	'((1 1 0 3 5 3)
	  (0 3 0 3 4 4)
	  (1 3 2 3 3 4)))