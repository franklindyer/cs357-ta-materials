#lang racket

(display "Hello World!\n")

(define x 34)
(define y 35)

(define make-list-of-one
  (lambda (item)
    (cons item '())))

(define make-list-of-two
  (lambda (item1 item2)
    (cons item1 (make-list-of-one item2))))

(define first-group
  (lambda (ls)
    (make-list-of-two (car ls) (cadr ls))))

(define second-group
  (lambda (ls) (cddr ls)))

(define regroup
  (lambda (list-of-4)
    (make-list-of-two (first-group list-of-4) (second-group list-of-4))))
