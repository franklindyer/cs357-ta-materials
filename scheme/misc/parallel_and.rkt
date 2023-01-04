#lang racket

(define-syntax and1
	(syntax-rules ()
		((and1 x y)
		 (let ((tmp x))
		      (if tmp y #f)))))

(define-syntax and2
	(syntax-rules ()
		((and2 x y)
		 (let ((tmp y))
		      (if tmp x #f)))))

(define-syntax andp
	(syntax-rules ()
	        ((andp x y)
		 (let* ((ch (make-channel))
		        (th1 (thread (lambda () (channel-put ch x))))
			(th2 (thread (lambda () (channel-put ch y)))))
		       (and (channel-get ch) (channel-get ch))))))

(define btm '(eval btm))
'(and1 #f (eval btm))
'(and1 #t (eval btm))
'(and1 (eval btm) #f)
'(and2 #f (eval btm))
'(and2 (eval btm) #f)
'(andp #f (eval btm))
'(andp (eval btm) #f)

(define-syntax orp
	(syntax-rules ()
		((orp x y)
		 (not (andp (not x) (not y))))))

(define-syntax ifp
	(syntax-rules ()
		((ifp test x y)
		 (let* ((ch (make-channel))
		        (th1 (thread (lambda () (if (eqv? x y) (channel-put ch x) 0))))
			(th2 (thread (lambda () (channel-put ch (if test x y))))))
		       (channel-get ch)))))

(define (comp-list-p l1 l2)
	(if (empty? l1)
	    (empty? l2)
	    (andp (eqv? (eval (car l1)) (eval (car l2)))
	    	  (comp-list-p (cdr l1) (cdr l2)))))