;; CS 357 Recitation 1-30-2023
;; Abigail Pribisova

(define member? (lambda (x s) (if (null? s) #f (if (equal? x (car s)) #t (member? x (cdr s))))))

;; 1. contains?
;; (contains? a1 a2) should give #t if s1 is contained in s2
;;    and #f if a1 is not contained in s2

(define contains? (lambda (s1 s2) (if (null? s1) #t (if (member? (car s1) s2) (contains? (cdr s1) s2) #f))))
;; empty (or null) set is conained within every set
;; checks if the first element of the first set is a member of the second set
;; if so, checks contains with the cdr of the first list
;; if not, returns false

;; 2. set-equals?
;; Checks if two sets are teh same i.e. have the same elements
;; (set-equals '(1 2 3) '(2 3 1)) => #t

(define set-equals? (lambda (s1 s2) (if (and (contains? s1 s2) (contains? s2 s1)) #t #f)))
;; sets are equal is they both contain each other
