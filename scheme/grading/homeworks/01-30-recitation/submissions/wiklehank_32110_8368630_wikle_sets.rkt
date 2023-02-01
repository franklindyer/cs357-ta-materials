

(define member?
    (lambda (x ls)
        (cond
            ((null? ls) #f)
            ((equal? (car ls) x) #t)
            (else (member? x (cdr ls)))
        )
    )
)

(define set-insert
    (lambda (x s)
        (if (member? x s)
            s
            (cons x s)
        )
    )
)

; (set-insert 5 '(1 2 3))
; (set-insert 5 '(1 2 3 4 5))

(define union
    (lambda (s1 s2)
        (if
            (null? s1)
            s2
            (union (cdr s1) (set-insert (car s1) s2))
        )
    )
)

; (union '(27 28 29) '(2 3 4))

(define contains?
    (lambda (s1 s2)
        (cond
            ((null? s1) #t)
            ((not (member? (car s1) s2)) #f)
            (else (contains? (cdr s1) s2))
        )
    )
)

; (contains? '(1 2 3) '(2 3 4 5 6))                                                                  
; (contains? '(1 2 3) '(3 2 1 200))                                                                  
; (contains? '(1 2 3) '(1 2 3 4))                                                                    
; (contains? '(1 2 3 4) '(1 2 3))                                                                    
; (contains? '(1 2 3 4) '(4 3 2 1))

(define set-equals?
    (lambda (s1 s2)
        (and (contains? s1 s2) (contains? s2 s1))
    )
)

; (set-equals? '(1 2 3) '(2 3 1))                                                                
; (set-equals? '(2 3 4) '(2 3 5))

