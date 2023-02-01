#lang racket
(define x 5)

(define contains?
  (lambda s1 s2)
  (cond ((null? s1) #f)
        ((member (car s1)  s2)
         (contains  (cdr s1)  s2)
         #t)
        (else #f)
        )
  )
  