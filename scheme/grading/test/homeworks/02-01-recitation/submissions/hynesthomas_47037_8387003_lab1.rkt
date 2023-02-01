#lang racket

(define member? (lambda (x set1) (if (null? set1) #f (if (equal? x (car set1)) #t (member? (cdr set1))))))

(define subset?
   (lambda (set1 set2)
     (if (null? set1) #t
     (if (null? set2) #t
     (if (member? (car set1) set2)
         (subset? (cdr set1) set2)
         #f
     )))))
