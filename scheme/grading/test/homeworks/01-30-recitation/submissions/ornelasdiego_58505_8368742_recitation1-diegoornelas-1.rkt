;; Problem 1: contains? (s1 s2)
;; (contains? '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '(1 2 3 200)) => #t
#lang racket

(define contains?
  (lambda (s1 s2)
    (if (null? s1)
        #t
        (if (member? (car s1) s2)
            (if (null? (cdr s1))
                #t
                (contains? (cdr s1) s2))
            #f))))

(define member?
  (lambda (item ls)
    (if (null? ls)
      #f
      (or (equal? (car ls) item)
                (member? item (cdr ls))))))

;: Problem 2: set-equals
;; (set-equals '(1 2 3) '(2 1 3)) => #t
;; (set-equals '(1 2 3) '(2 3 5)) => #f
(define set-equals
  (lambda (s1 s2)
    (and (contains? s1 s2) (contains? s2 s1))))