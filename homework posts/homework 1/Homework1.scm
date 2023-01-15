(define name '("Last" "First"))
(define netID "netID@unm.edu")

;; For prompts providing double quotes, fill in the exact answer in the quotes:
;;      e.g. for problem n.n,
;;          with a prompt: "what is the result of running the code ''(+ 1 2)"
;;          and the skeleton: (define problemn.n "")
;;          you should fill in: (define problemn.n "''(+ 1 2)")

;; For prompts providing the empty list, replace the empty list with the exact result or function contents:
;;      e.g. for problem n.n,
;;          with a prompt: "give code which produces ''(+ 1 2)"
;;          and the skeleton: (define problemn.n '())
;;          you should fill in: (define problemn.n ''(+ 1 2))
;;      e.g. for problem n.n,
;;          with a prompt: "what is the result of running the code (/ 1 2)"
;;          and the skeleton: (define problemn.n '())
;;          you should fill in: (define problemn.n 1/2)
;;
;;      Do NOT, when required to proide an exact answer, merely give the code you are required to evaluate
;;      e.g. for problem n.n,
;;          with a prompt: "what is the result of running the code (/ 1 2)"
;;          and the skeleton: (define problemn.n '())
;;          you should NOT fill in: (define problemn.n (/ 1 2))


;; problem 1.2, page 13
(define problem1.2
    '(
        ('a "")
        ('b "")
        ('c "")
        ('d "")
        ('e "")
        ('f "")
        ('g "")
        ('h "")
    )
)


;; problem 1.3, page 13
(define problem1.3
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
    )
)


;; problem 1.4, page 13
(define problem1.4
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
    )
)


;; problem 1.5, page 14
(define problem1.5
    '(
        ('a '())
        ('b '())
        ('c '())
    )
)


;; problem 1.6, page 19
(define problem1.6
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
        ('e '())
    )
)


;; problem 1.10, page 25
(define problem1.10
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
    )
)


;; problem 1.14, page 30
(define problem1.14
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
        ('e '())
        ('f '())
    )
)


;; problem 2.1, page 39
(define second
    '()
)


;; problem 2.3, page 39
(define make-list-of-one
    '()
)
(define make-list-of-two
    '()
)
(define firsts-of-both
    '()
)
(define problem2.3
    '(
        ('a '())
        ('b '())
    )
)


;; problem 2.4, page 39
(define juggle
    '()
)


;; problem 2.6, page 45
(define a #t)
(define b #t)
(define c #t)
(define e #f)
(define f #f)
(define problem2.6
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
    )
)


;; problem 2.7, page 45
(define expr #f)
(define problem2.7
    '(
        ('a '())
        ('b '())
        ('c '())
        ('d '())
    )
)


;; problem 2.10, page 53
(define last-item
    '()
)
(define member?
    '()
)
(define remove-1st
    '()
)


;; problem 2.12, page 54
(define mystery
    (lambda (ls)
        (if (null? (cddr ls))
            (cons (car ls) '())
            (cons (car ls) (mystery (cdr ls)))
        )
    )
)
(define problem2.12
    '(
        ('a '())
        ('b "") ;; BEHAVIOR
        ('b "") ;; REASONABLE NAME
    )
)


;; problem 2.13, page 54
(define subst-1st
    '()
)


;; problem 2.14, page 55
(define insert-left-1st
    '()
)


;; problem 2.15, page 55
(define list-of-first-items
    '()
)


;; problem 2.16, page 56
(define replace
    '()
)


;; problem 2.18, page 56
(define remove-last
    '()
)