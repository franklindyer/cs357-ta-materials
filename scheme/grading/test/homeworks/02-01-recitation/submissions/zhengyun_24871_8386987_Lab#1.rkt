#lang racket
(define subset?
  (lambda (set1 set2)
    (if (null? set1)
        #t
        (if
         (member? (car set1) (subset? ((cadr set1) set2)) #f
    )))))


(define set-equals?
  (lambda (set1 set2)
    (and
     (if (null? set1)
        #t
        (if
         (member? (car set1) (subset? ((cadr set1) set2)) #f
    )))
      (if (null? set2)
        #t
        (if
         (member? (car set2) (subset? ((cadr set2) set1)) #f

    )
  )))))