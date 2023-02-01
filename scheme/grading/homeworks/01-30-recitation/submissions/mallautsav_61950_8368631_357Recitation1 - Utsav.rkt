
(define x 2)

;;1. contains?
;; contains (s1 s2)return #t if s1 is in s2 else #f

(define contains?
  (lambda (s1 s2)
    (if
     (null? s1)
     #f
     (or (equal? x (car s1)) (contains? x (cdr s2))))
  )
)

(define set-equals