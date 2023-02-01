(define x 5)

(define member?
  (lambda (x ls)
    (if (null? ls ) #f (or (equal? x (car ls)) (member? x (cdr ls)) ))
  )
)

(define set-insert
    (lambda (x s)
      (if (member? x s) s (cons x s))
    )
)

(define union 
  (lambda (s1 s2)
    (if 
      (null? s1)
      s2
      (union (cdr s1) (set-insert (car s1) s2))
    )
  )
)

(define contains?
    (lambda s1 s2
      (if null? s1) () () )
    )
)

(define set-equals?
  (lambda s1 s2 
      (if union? (t) (f))
  )
)

