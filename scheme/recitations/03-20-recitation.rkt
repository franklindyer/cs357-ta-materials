#lang racket

(define swap (lambda (f) (lambda (x y) (f y x))))

;; Write the "reverse" function, using fold

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

(define uncurry (lambda (f) (lambda (x y) ((f x) y))))

;; (snoc '(1 2 3) 4) ==> '(1 2 3 4)
;; ((snoc-c '(1 2 3)) 4) ==> '(1 2 3 4)
;; ((snoc-c '(1 2 3)) 'a) ==> '(1 2 3 a)
;; ((snoc-c '()) 1) ==> '(1)
;; (snoc-c '(1 2 3 4 5))
;; given : 1,   f = (snoc-c '(2 3 4 5 ... 1000))
;; (f 'a) ==> '(2 3 4 5 ... 1000 a)
;; (f 6) ==> '(2 3 4 5 ... 1000 6)

;; Want a function g such that
;; (g 'a) ==> '(1 2 3 4 5 ... 1000 a)
;; (g 6) ==> '(1 2 3 4 5 ... 1000 6)

;; (define g (compose (lambda (ls) (cons 1 ls)) f))

;; (define g (lambda (x) (append '(1 2 3 4 5 ... 1000) (cons x '()))))

;; say we have some non-null list (cons x ls)
;; if we're given (snoc-c ls) and x
;; we can build (snoc-c (cons x ls)) as (compose (lambda (ls2) (cons x ls2)) (snoc-c ls))
;; Come back and define this using fold as well
(define snoc-c (fold (lambda (x f) (compose (lambda (ls) (cons x ls)) f)) (lambda (x) (cons x '()))))
;; (define another-snoc (lambda (x) (fold __ __)))
;;(define another-snoc
;;  (letrec (
;;           (helper ())
;;           )

;;    )
;;)
(define snoc-2
  (lambda (ls x)
    ((fold cons (list x)) ls))
  )

(define snoc-2-c
  (lambda (x)
    (fold cons (list x))
   )
  )

(define snoc (swap (uncurry snoc-2-c)))

;; (define snoc (uncurry snoc-c))

(define old-snoc (lambda (ls x) (append ls (cons x '()))))

;; If ls is a non-null list, then
;;   (reverse ls) will give (proc (car ls) (reverse (cdr ls)))
;;   (reverse (cons x ls)) will give (proc x (reverse ls))
;;   (1 2 3 4 5)        1    (5 4 3 2)
;;         (append '(5 4 3 2) '(1)) ==> '(5 4 3 2 1)
;;         (snoc '(5 4 3 2) 1) ==> '(5 4 3 2 1)
(define reverse (fold (swap old-snoc) '()))

(define fold-tree
  (lambda (base-val leaf-proc fork-proc)
    (letrec ((helper
      (lambda (sexpr)
        (cond ((null? sexpr) base-val)
              ((pair? sexpr) (fork-proc (helper (car sexpr)) (helper (cdr sexpr))))
              (else (leaf-proc sexpr))
        )
        )))
      helper
    )
  )
)


(define add (fold-tree 0 identity +))

(define copy (fold-tree '() identity cons))

(define size (fold-tree 0 (lambda (x) 1) +))

(define depth (fold-tree 0 (lambda (x) 0) (lambda (ld rd) (add1 (max ld rd)))))

(define count-c (lambda (pred) (fold-tree 0 (lambda (x) (if (pred x) 1 0)) +)))
(define count (uncurry count-c))
