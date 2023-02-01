#lang racket
(define member?
  (lambda (x ls)
    (if (null? ls) #f (if (equal? x (car ls)) #t (member? x (cdr ls))))))
;; (subset? '(1 2 3) '(2 3 4 5)) ==> #f
;; (subset? '(2 3) '(3 2 1)) ==> #t
;; (subset? '() '(1 2 3)) ==> #t
;; if set1 is the empty set, always return true
;; otherwise check if the first element of set1 is a member of set2
;; and then recursively call subset? on the rest of set1 with set2
;; we also want all elements of set1 to be members of set2 so
;; we need an "and" at the start
(define subset?
  (lambda (set1 set2)
    (if (null? set1) #t (and (member? (car set1) set2) (subset? (cdr set1) set2)))))

;; (set-equals? '(1 2 3) '(1 2 3 4)) ==> #f
;; (set-equals? '(1 2 3) '(3 2 1)) ==> #t
;; since we already have the subset? procedure we can use that
;; the two sets are equal if both are subsets of each other so we can use the above procedure
(define set-equals?
  (lambda (set1 set2)
    (and (subset? set1 set2) (subset? set2 set1))))
    