#lang racket
(define member?
  (lambda (item ls)
    (if (null? ls)
        #f
        (or (equal? (car ls) item)
            (member? item (cdr ls))))))

;; (subset? '(1 2 3) '2 3 4 5)) --> #f
;; (subset? '(2 3) '('3 2 1)) --> #t
;; (subset? '() '(1)) ---> #t
;; (subset? set1 set2) should return #t if set2 contains every elembent of set1 and #f otherwise
(define subset?
  (lambda (set1 set2)
    (if (null? set1)
        #t
        (if (member? (car set1) set2)
            (subset? (cdr set1) set2)
            #f))
    )
  )

;; (set-equals? '(1 2 3) '(1 2 3 4)) --> #f
;; (set-equals? '(1 2 3) '(3 2 1)) --> #t
;; (set-equals? '() '(1 2 3 4)) --> #t
(define set-equals?
  (lambda (set1 set2)
   (and (subset? set1 set2) (subset? set2 set1))
   )
 )