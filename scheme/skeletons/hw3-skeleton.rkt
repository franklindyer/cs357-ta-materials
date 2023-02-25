#lang racket

;; CS 357 Homework #3, Spring 2023
;; YOUR NAME HERE

;; NOTE: Test cases not finished yet. Coming soon!

;; Exercise 7.2
;; ((compose3 add1 sub1 add1) 5) ==> 6
;; ((compose3 (lambda (x) (* x x)) (lambda (x) (* x x)) add1) 3) ==> 256
(define compose3 0)

;; Exercise 7.3
;; ((compose-many add1 add1 add1 add1 add1) 5) ==> 10
;; ((compose-many) 'batman) ==> 'batman
(define compose-many 0)

;; Exercise 7.6
;; (map-first-two + '(5 4 3 2 1)) ==> '(9 7 5 3)
;; (map-first-two cons '(1 (2 3) (4 5) (6 7 8))) ==> '((1 2 3) ((2 3) 4 5) ((4 5) 6 7 8))
(define map-first-two 0)

;; Exercise 7.7
;; (reduce + '(5 -1 3 7 2 3 5)) ==> 24
;; (reduce * '(534 9549 201 59 11238 0 4848)) ==> 0
(define reduce 0)

;; Exercise 7.8
;; (andmap positive? '(4 5 1 200 0 7 8)) ==> #f
;; (andmap (lambda (ls) (not (null? ls))) '((1 2 3) (4 5) (6 7) (8) (9 10))) ==> #t
(define andmap 0)

;; Exercise 7.12
;; ((curried* 11) 12) ==> 132
;; (map (curried* -2) '(1 2 4 8 16 32)) ==> '(-2 -4 -8 -16 -32 -64)
(define curried* 0)

;; Exercise 7.18
;; (between? 4 5 6) ==> #t
;; (map (lambda (f) (f 10)) (map (between?-c 3) '(1 2 3 4 8 9 10 11)))
;;   ==> '(#f #f #f #t #t #t #f #f)
(define between? 0)
(define between?-c 0)

;; Exercise 7.22
;; ((mult-by-scalar 2) '(5 6 7 8)) ==> '(10 12 14 16)
;; (map (mult-by-scalar -1) '(() (1) (1 -1) (1 -1 1 -1))) ==> '(() (-1) (-1 1) (-1 1 -1 1))
(define book-flat-recur
  (lambda (seed list-proc)
    (letrec
        ((helper
          (lambda (ls)
            (if (null? ls)
                seed
                (list-proc (car ls) (helper (cdr ls)))))))
      helper
    )
  )
)

(define mult-by-scalar 0)

;; Exercise 7.30
;; (reverse-all '((1 2 3) (4 5) ((6 7 8) (9 10 11))))
;;   ==> '(((11 10 9) (8 7 6)) (5 4) (3 2 1))
;; (reverse-all '(x (y (z (((a) b) c)))))
;;   ==> '((((c (b (a))) z) y) x)
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
;; ((flat-recur 1 +) '(1 2 3 4)) ==> 11
;; ((flat-recur '(a b c) cons) '(w x y z)) ==> '(w x y z a b c)
(define flat-recur 0)

;; Problem 1
;; (equal? (iota 100) (reverse (reverse (iota 100)))) ==> #t
;; (map iota '(1 2 3 4)) ==> '((1) (1 2) (1 2 3) (1 2 3 4))
(define tail-recur 0)
(define reverse 0)
(define iota 0)

;; Problem 2
;; (map (disjunction2 positive? (lambda (x) (= x -10))) '(-10 -5 0 5 10 15))
;;   ==> '(#t #f #f #t #t #t)
(define disjunction2 0)

;; Problem 3
;; (map (disjunction pair? number? null?) '(a (b c d) e () f () g (((h))) 1))
;;   ==> '(#f #t #f #t #f #t #f #t #t)
(define disjunction 0)

;; Problem 4
;; (matrix-map (lambda (x) (+ x 1)) '((1 2 3) (4 5 6) (7 8 9)))
;;   ==> '((2 3 4) (5 6 7) (8 9 10))
;; (matrix-map (lambda (x) (* x 2)) '(() () () ()))
;;   ==> '(() () () ())
(define matrix-map 0)

;; Problem 5
;; (delete-duplicates '(x y x x y x)) ==> '(x y) OR '(y x)
;; (assoc 'a '((x 4) (y 5) (z 6) (a 7) (b 8) (a 9))) ==> '(a 7)
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
;; (apply avg-fact (apply shortest (map iota '(5 20 7 3 23 7 8)))) ==> 3
;; (apply sum-of-squares (list-ref (map iota (iota 20)) 13)) ==> 819

;; (define length 0)
;; (define sum-of-squares 0)
;; (define avg 0)
;; (define avg-odd 0)
;; (define shortest 0)
;; (define avg-fact 0)
;; (define tally 0)
;; (define list-ref 0)
