#lang racket

(define member?
  (lambda (item ls)
    (if (null? ls) #f (or (equal? (car ls) item) (member? item (cdr ls))))))

(define subset?
  (lambda (set1 set2)
    (cond
      ((and (null? set1) (not (null? set2))) #t)
      ((and (not (null? set1)) (null? set2)) #f)
      ((member? (car set1) set2) subset? (cdr set1) set2))))
(subset? '(2 3 4) '(3 2 1)) 