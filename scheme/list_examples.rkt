#lang racket

(define (bad-is-list1? x)
	(or (null? x) (bad-is-list1? (cdr x))))

(define (bad-is-list2? x)
	(or (null? x)
	    (and (bad-is-list2? (cdr x))
	    	 (pair? x))))

(define (is-list? x)
	(or (null? x)
	    (and (pair? x) (is-list? (cdr x)))))

(define (last1 ls)
	(if (pair? (cdr ls))
	    (last1 (cdr ls))
	    (car ls)))

(define (last2 ls)
	(let ((hd (car ls))
	      (tl (cdr ls)))
	     (if (pair? tl)
	     	 (last2 tl)
		 hd)))

