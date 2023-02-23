#lang racket

;; CS 357 Homework #3, Spring 2023
;; YOUR NAME HERE

;; Exercise 7.2
(define compose3 0)

;; Exercise 7.3
(define compose-many 0)

;; Exercise 7.6
(define map-first-two 0)

;; Exercise 7.7
(define reduce 0)

;; Exercise 7.8
(define andmap 0)

;; Exercise 7.12
(define curried* 0)

;; Exercise 7.18
(define between? 0)
(define between?-c 0)

;; Exercise 7.22
(define book-flat-recur
  (lambda (seed list-proc)
    (letrec
        ((helper
          (lambda (ls)
            (if (null? ls)
                seed
                (list-proc (car ls) (helper cdr ls))))))
      helper
    )
  )
)

(define mult-by-scalar 0)

;; Exercise 7.30
(define book-deep-recur
  (lambda (seed item-proc list-proc)
    (letrec
        ((helper
          (lambda (ls)
            (if (null? ls)
                seed
                (let ((a (car ls)))
                  (if (or (pair? a) (null? a))
                      (list-proc (helper a) (helper (cdr ls)))
                      (item-proc a (helper (cdr ls)))))))))
      helper
      )
    )
)

;; Exercise 7.31
(define flat-recur 0)

;; Problem 1
(define tail-recur 0)
(define reverse 0)
(define iota 0)

;; Problem 2
(define disjunction2 0)

;; Problem 3
(define disjunction 0)

;; Problem 4
(define matrix-map 0)

;; Problem 5
(define fold
      (lambda (seed proc)
        (letrec
          ((pattern
            (lambda (ls)
              (if (null? ls)
                  seed
                  (proc (car ls)
                        (pattern (cdr ls)))))))
pattern)))

(define delete-duplicates 0)
(define assoc 0)

;; Problem 6
;; Only use apply, select, map, filter, outer-product and iota

;; (define length 0)
;; (define sum-of-squares 0)
;; (define avg 0)
;; (define avg-odd 0)
;; (define shortest 0)
;; (define avg-fact 0)
;; (define tally 0)
;; (define list-ref 0)
