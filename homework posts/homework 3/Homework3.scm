(define name '("Last" "First"))
(define netID "netID@unm.edu")


;; === Part 1, Points: 10, Weight: 1/3 ===
(define compose
    (lambda (f g)
        (lambda (x)
            (f (g x))
        )
    )
)

(define id (lambda (x) x))

;; problem1-1-7.2    p234
;; Points: 1/10
;; ((compose3 id id id) 4) => 4
(define compose3
    '()
)


;; problem1-1-7.3    p234
;; Points: 1/10
;; ((compose-many id id id id) 4) => 4
(define compose-many
    '()
)


;; problem1-1-7.6    p235
;; Points: 1/10
;; (map-first-two + '(2 3 4 5 7)) => '(5 7 9 12)
(define map-first-two
    '()
)


;; problem1-1-7.7    p235
;; Points: 1/10
;; (reduce + '(2 3 4 5 7)) => 21
(define reduce
    '()
)


;; problem1-1-7.8    p236
;; Points: 1/10
;; (andmap positive? '(3 4 6 9)) => #t
(define andmap
    '()
)


;; problem1-1-7.12-a    p243
;; Points: 0.5/10
;; ((curried* 5) 25) => 125
(define curried*
    '()
)

;; problem1-1-7.12-b    p243
;; Points: 0.5/10
;; (times10 580) => 5800
(define times10
    '()
)


;; problem1-1-7.18-a    p244
;; Points: 0.5/10
;; (between? 4 5 6) => #t
(define between?
    '()
)
;; problem1-1-7.18-b    p244
;; Points: 0.5/10
;; (((between?-c 4) 5) 6) => #t
(define between?-c
    '()
)


;; problem1-1-7.22    p250
;; Points: 1/10
;; ((mult-by-scalar 3) '(1 -2 3 -4)) => '(3 -6 9 -12)
(define mult-by-scalar
    '()
)

(define deep-recur
    (lambda (seed item-proc list-proc)
        (letrec
            (
                (helper
                    (lambda (ls)
                        (if (null? ls)
                            seed
                            (let ((a (car ls)))
                                (if (or (pair? a) (null? a))
                                    (list-proc (helper a) (helper (cdr ls)))
                                    (item-proc a (helper (cdr ls)))
                                )
                            )
                        )
                    )
                )
            )
            helper
        )
    )
)

;; problem1-1-7.30    p
;; Points: 1/10
;; (reverse-all '(1 (2 3) 4)) => '(4 (3 2) 1)
(define reverse-all
    '()
)


;; problem1-1-7.31    p
;; Points: 1/10
;; ((flat-recur 0 +) '(1 2 3)) => 6
(define flat-recur
    '()
)


;; === Part 2, Points: 10, Weight: 1/3 ===

;; problem2-1-a
;; Points: 1/8
;; ((tail-recur zero? sub1 * 1) 5) => 120
(define tail-recur
    '()
)

;; problem2-1-b
;; Points: 1/8
;; (reverse '(1 2 3)) => '(3 2 1)
(define reverse
    '()
)

;; problem2-1-c
;; Points: 1/8
;; (iota 3) => '(1 2 3)
(define iota
    '()
)

;; problem2-2-
;; Points: 1/8
;; ((disjunction2 symbol? procedure?) +) => #t
(define disjunction2
    '()
)

;; problem2-3-
;; Points: 1/8
;; ((disjunction procedure?) +) => #t
(define disjunction
    '()
)

;; problem2-4-
;; Points: 1/8
;; (matrix-map even? '((1 2) (3 4))) => '((#f #t) (#f #t))
(define matrix-map
    '()
)

;; problem2-5
(define fold
    (lambda (seed proc)
        (letrec
            (
                (pattern
                    (lambda (ls)
                        (if (null? ls)
                            seed
                            (proc (car ls) (pattern (cdr ls)))
                        )
                    )
                )
            )
            pattern
        )
    )
)


;; problem2-5-a
;; Points: 1/8
;; (delete-duplicates '(a b a b a b a b)) => '(a b)
(define delete-duplicates
    '()
)

;; problem2-5-b
;; Points: 1/8
;; (assoc 'b '((a 1) (b 2))) => '(b 2)
(define assoc
    '()
)


;; === Part 3, Points: 8, Weight: 1/3 ===

;; problem3-1-
;; Points: 1/8
;; (length '(1 2 3 4)) => 4
(define length
    '()
)

;; problem3-2-
;; Points: 1/8
;; (sum-of-squares 3 4 5 6) => 86
(define sum-of-squares
    '()
)

;; problem3-3-
;; Points: 1/8
;; (avg 4 5 5 5 5 5) => 29/6
(define avg
    '()
)

;; problem3-4-
;; Points: 1/8
;; (avg-odd 4 5 5 5 5 5) => 5
(define avg-odd
    '()
)

;; problem3-5-
;; Points: 1/8
;; (shortest '(1 2) '(2 3 4) '(4) '(5 6 7 8)) => '(4)
(define shortest
    '()
)

;; problem3-6-
;; Points: 1/8
;; (avg-fact 2 3 4) => 32/3
(define avg-fact
    '()
)

;; problem3-7-
;; Points: 1/8
;; ((tally even?) '(1 2 3 4 5)) => 2
(define tally
    '()
)

;; problem3-8-
;; Points: 1/8
;; (list-ref '(5 7 60 98) 0) => 5
(define list-ref
    '()
)
