#lang racket

(define fold
  (lambda (proc seed)
    (letrec
      ((pattern
        (lambda (ls)
          (if (null? ls)
              seed
              (proc (car ls)
                    (pattern (cdr ls)))))))
      pattern)))

;; (lambda (ls)
;;    (if (null? ls)
;;       ____
;;       ____))
;;

(define length
  (lambda (ls)
    (if (null? ls)
        0
        (+ 1 (length (cdr ls))))
    )
  )

(define length2 (fold (lambda (x y) (+ 1 y)) 0))

(define count
  (lambda (item ls)
    (if (null? ls)
        0
        (+ (if (eq? (car ls) item) 1 0) (count item (cdr ls))))
    )
  )

;; (define count2 (fold __ __))

(define count2
  (lambda (item ls)
    ((fold (lambda (x y) (+ (if (eq? x item) 1 0) y)) 0) ls)
    )
  )

;; (count-c item) ==> function which counts the number of ocurrences of item in a list
(define count-c
  (lambda (item)
    (fold (lambda (x y) (+ (if (eq? x item) 1 0) y)) 0)
  )
  )

(define uncurry (lambda (f) (lambda (x y) ((f x) y))))

(define count3 (uncurry count-c))

;; TRICKY! I would suggest trying this
;; (define count (lambda (ls item) ...))
;; (define count-c (fold __ __))

;; duplicate-elements
;; '(1 2 3) ---> '(1 1 2 2 3 3)
(define duplicate-elements
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (car ls) (cons (car ls) (duplicate-elements (cdr ls)))))
    )
  )

;; we have some list that looks like (x1 x2 x3 ... xn)
;; x <-- x1
;; y <-- (x2 x2 x3 x3 ... xn xn)
;; (cons x (cons x y))
(define duplicate-elements2 (fold (lambda (x y) (cons x (cons x y))) '()))

;; '(1 2 3) --> 1^2 + 2^2 + 3^2 = 14
(define sum-squares-list
  (lambda (ls)
    (if (null? ls)
        0
        (+ (* (car ls) (car ls)) (sum-squares-list (cdr ls))))
    )
  )

(define sum-squares-list2 (fold (lambda (x y) (+ (* x x) y)) 0))

(define add (lambda args (apply + args)))

(define give-me-the-list-of-args (lambda args args))

(define print-args-after-third (lambda (x y z . rest) rest))

(define add-c (curry +))

(define my-curry
  (lambda (f)
    (lambda (x)
      (lambda (y)
        (f x y)
        )
      )
    )
  )

(define curry-3
  (lambda (f) ;; expect f to take 3 arguments
    (lambda (x)
      (lambda (y)
        (lambda (z)
          (f x y z)
          )
        )
      )
    )
  )

;; +

;; (add-all)       args   '()
;; (add-all x1 x2 ... xn)
;;   --> (+ x1 (add-all x2 ... xn))

;; (add-all 1 2 3)     args <-- '(1 2 3),    not null
;; --> (+ 1 (apply add-all '(2 3)))

(define add-all
  (lambda args
    (if (null? args)
        0
        (+ (car args) (add-all (cdr args))))
    )
)
