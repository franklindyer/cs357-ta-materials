#lang racket
;; #1
;; (subset? '(1 2 3) '(2 3 4 5)) ==> #f
;; (subset? '(2 3) '(3 2 1)) ==> #t
;; (subset? '() '(1 2 3)) ==> #t
;; (subset? set1 set2) should return #t if set2 contains every element of set1 & #f otherwise
(define member?
  (lambda (x set1)
    (if (null? set1)
        #f
        (if
         (equal? x (car set1))
         #t
         (member? x (cdr set1)))
     )
   )
)
(define subset?
  (lambda (set1 set2)
    (if (null? set1) #t
        (if (member? (car set1) (set2)) (subset? (cdr set1) set2))
    )
  )
)

;; #2
;; (set-equals? '(1 2 3) '(1 2 3 4)) ==> #f
;; (set-equals? '(1 2 3) '(3 2 1)) ==> #t
;; (set-euqals? set1 set2) should return true if set1 and set2 contains all the same elements
;;(define set-equals?(lambda (set1 set2)))