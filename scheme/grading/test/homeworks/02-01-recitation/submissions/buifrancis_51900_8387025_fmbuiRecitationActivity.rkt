#lang racket

(define member?
  (lambda (item ls)
    (if (null? ls)
	#f
	(or (eq? (car ls) item)
	    (member? item (cdr ls))))))

(define subset?
  (lambda (set1 set2)
    (or (null? set1) ;; null set is subset of any set
        (and (member? (car set1) set2)  
	     (subset? (cdr set1) set2)))))

(subset? '(1 3 2) '(1 2 3 4))



(define (set-equals? set1 set2)
          (cond ((eqv? set1 set2) #t)
          (else #f)))


(set-equals? '(1 2 3) '(1 2 3))
