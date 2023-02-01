#lang racket


(define member?
  (lambda (x ls)
    (if (null? ls)
        #f
        (if (equal? x (car ls))
            #t
            (member? x (cdr ls))))))

(define remove-element
  (lambda (x ls)
    (if (null? ls)
        '()
        (if (equal? x (car ls))
            (cdr ls)
            (remove-element x (cdr ls)))))

(define subset?
  (lambda (set1 set2)
    (if (null? set1)
        #t
        (if (member? (car set1) set2)
           (subset? (cdr set1) set2)
           #f))))

(subset? '(1 2 3) '(2 3 4 5))
(subset? '(2 3) '(3 2 1))
(subset? '() '(1 2 3))

(define set-equals?
  (lambda (set1 set2)
    (if (and (null? set1) (null? set2))
        #t
        (if (member? (car set1) set2)
            (set-equals? (cdr set1) (remove-element (cdr set1) set2))
            #f ))))
            

        