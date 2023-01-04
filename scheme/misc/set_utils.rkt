#lang racket

(define (concat-stack before after)
	(if (empty? before)
	    after
	    (concat-stack (cdr before) (cons (car before) after))))

(define (insert-set-cum cmp e before after)
	(cond ((empty? after) (concat-stack before (cons e '())))
	      ((cmp e (car after)) (concat-stack before (cons e after)))
	      ((cmp (car after) e) (insert-set-cum cmp e (cons (car after) before) (cdr after)))
	      (else (concat-stack before after))))

(define (insert-set cmp e S)
	(insert-set-cum cmp e '() S))

(define (in-set cmp e S)
	(cond ((empty? S) #f)
	      ((cmp e (car S)) #f)
	      ((cmp (car S) e) (in-set cmp e (cdr S)))
	      (else #t)))

(define (subset-bad cmp S1 S2)
	(if (empty? S1)
	    #t
	    (and (in-set cmp (car S1) S2) (subset-bad cmp (cdr S1) S2))))

(define (subset cmp S1 S2)
	(cond ((empty? S1) #t)
	      ((empty? S2) #f)
	      ((cmp (car S1) (car S2)) #f)
	      ((cmp (car S2) (car S1)) (subset cmp S1 (cdr S2)))
	      (else (subset cmp (cdr S1) (cdr S2)))))

(provide in-set subset insert-set concat-stack)