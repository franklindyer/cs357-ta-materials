
(define x 5)

(define member?
  (lambda (x ls)
    (if (null? ls)
        #f
    (or (equal? x (car ls)) (member? x (cdr ls))))
  )
)

(define set-insert
  (lambda (x s)
    (if (member? x s) s (cons x s))
    )
  )

(define union
  (lambda (s1 s2)
    (if (null? s1)
        s2
    (union (cdr s1) (set-insert (car s1) s2)))
    )
  )

;; 1. contains?
;;(contains s1 s2) should give #t if s1 is contained in s2
;; and #f if s1 is not contained in s2
;; 2. setequals?
;; Checks if two sets are the same
;; (set-equals? '(1 2 3) (' 2 3 1)) => #t
;; (set-equals? '(2 3 4) '(2 3 5)) => #f

(define contains?
  (lambda (s1 s2)
    (if (null? s1)
        #t
        (member? (car s1) s2))
      )
 )

(define set-equals
  (lambda (s1 s2)
    
    )
  )