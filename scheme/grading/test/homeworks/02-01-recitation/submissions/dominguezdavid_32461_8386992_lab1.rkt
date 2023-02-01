#lang racket
;; David Dominguez
;; 2/1/23

(define member?
  (lambda (x ls)
    (if (null? ls) 
	#f 
	(if 
	  (equal? x (car ls)) 
	  #t
	  (member? x (cdr ls))))))

(define set-insert
  (lambda (x set1)
;;    (if (null? set1) (cons x '()) (if (member? x set1) set1 (cons x set1)))))
    (if (member? x set1) set1 (cons x set1))))

(define union-two
  (lambda (set1 set2)
    (if (null? set1) set2
	(set-insert (car set1) (union-two (cdr set1) set2)))))

(define subset?
  (lambda (set1 set2)
    (if (null? set1) 
	#t
	(if (member? (car set1) set2)
	    (subset? (cdr set1) set2)
	    #f))))


;;(define set-equals?
;;  (lambda (set1 set2)
;;    )))
