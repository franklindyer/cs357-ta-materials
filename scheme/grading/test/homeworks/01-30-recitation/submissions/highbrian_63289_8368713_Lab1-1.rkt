#lang racket
(define member?
  (lambda (sexpr ls)
    (if (null? ls)
       #f
       (or (equal? sexpr (car ls))
           (member? sexpr (cdr ls))))))

(define contains?
  (lambda (s1 s2)
    (if (null? s1)
        #t
        (if (null? s2)
            #f
            (if (member? (car s1) s2)
                (contains? (cdr s1) s2)
                (contains? s1 (cdr s2)))))))

(define set-equals?
  (lambda (s1 s2)
    (contains? (s1 s2))))


(contains? '(1) '(1 2 3))
(contains? '(2) '(1 2 3))
(contains? '(3) '(1 2 3))

(contains? '(4) '(1 2 3))
(contains? '(5) '(1 2 3))
(contains? '(6) '(1 2 3))
