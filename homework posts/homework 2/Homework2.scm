(define name '("Last" "First"))
(define netID "netID@unm.edu")

;; problem1-4.4    p129
;; Points: 1/15
;; (deepen-1 '(a b c)) ;; => '((a) (b) (c))
(define deepen-1
    '()
)


;; problem1-4.6    p136
;; Points: 1/15
;; (insert-left-all 'z 'a '(a ( (b a) ((a (c)))))) ;; => '(z a ((b z a) ((z a (c)))))
(define insert-left-all
    '()
)


;; problem1-4.10    p143
;; Points: 1/15
;; (leftmost '((a b) (c (d e)))) ;; => 'a
(define leftmost
    '()
)


;; problem1-4.11    p143
;; Points: 1/15
;; (rightmost '((a b) (d (c d (f (g h) i) m n) u) v)) ;; => 'v
(define rightmost
    '()
)


;; problem1-4.18    p156
;; Points: 1/15
;; (length-it '(1 2 3)) ;; => 3
(define length-it
    '()
)


;; problem1-4.19    p156
;; Points: 1/15
;; (mk-asc-list-of-ints 10) ;; => '(1 2 3 4 5 6 7 8 9 10)
(define mk-asc-list-of-ints
    '()
)


;; Points: 1/15
;; (mk-desc-list-of-ints 10) ;; => '(10 9 8 7 6 5 4 3 2 1)
(define mk-desc-list-of-ints
    '()
)


;; problem1-4.20    p156
;; Points: 1/15
;; (occurs 'a '(a b a c a d)) ;; => 3
(define occurs
    '()
)


;; Points: 1/15
;; (occurs-it 'a '(a b a c a d)) ;; => 3
(define occurs-it
    '()
)


;; problem2-
;; Points: 1/15
;; (calculator '(1 + (2 * 8))) ;; => 17
(define calculator
    '()
)



;; problem3-
;; Points: 1/15
;; (infix->prefix '(1 + (2 * 8))) ;; => '(+ 1 (* 2 8))
(define infix->prefix
    '()
)


;; problem4-
    ;; NOTE: All helper functions should be tail-recursive and should be defined within the body of iota-iota using letrec.
;; Points: 1/15
;; (iota-iota 5) ;; => '((1 . 1) (1 . 2) (1 . 3) (1 . 4) (1 . 5) (2 . 1) (2 . 2) (2 . 3) (2 . 4) (2 . 5) (3 . 1) (3 . 2) (3 . 3) (3 . 4) (3 . 5) (4 . 1) (4 . 2) (4 . 3) (4 . 4) (4 . 5) (5 . 1) (5 . 2) (5 . 3) (5 . 4) (5 . 5))
(define iota-iota
    '()
)


;; problem5-
    ;; NOTE: Any helper functions you need should be defined within the body of digits->number using letrec.
;; Points: 1/15
;; (digits->number '(7 6 1 5)) ;; => 7615
(define digits->number
    '()
)



;; problem6-
;; Points: 1/15
;; (cond->if '(cond ((> x y) (- x y)) ((< x y) (- y x)) (else 0))) ;; => '(if (> x y) (- x y) (if (< x y) (- y x) 0))
(define cond->if
    '()
)



;; problem7-
    ;; NOTE: Do not use or define fact or expt, any helper functions you need should be defined within the body of cos using letrec
;; Points: 1/15
;; (cos 3.14159) ;; => -0.9999999999964797
(define cos
    '()
)


