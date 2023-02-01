#lang racket
(define subset?
  (lambda (set1 set2)
    (member? set1 set2)
   )
  )

(define set-equals?
  (lambda (set1 set2)

    )
  )

(define member?
  (lambda (x set1) (if (null? set1) #f (if (equal? x (car set1)) #t (member? (cdr set1))))))
