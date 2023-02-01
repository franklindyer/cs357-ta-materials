

;;1.contains?
(define contains?
  (lambda (new s1 s2)
    (if (null? s1) s1)
        #t
        (if (eq> (car s2) s2)
            #f
            (contains? (cdr s1 s2)))))


;;2.set-equals?
(define set-equals?
  (lambda (x set)
     (cond ((setEmpty? set) #f)
      ((equal? x (setFirst set)) #t)
      (else (set-equals? x ()))
      )
   )
)