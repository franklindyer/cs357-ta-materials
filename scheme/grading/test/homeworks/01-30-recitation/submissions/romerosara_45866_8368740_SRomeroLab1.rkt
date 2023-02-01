
;; Sara Romero
;; Lab Assignment 1
;; 01/30/23

(define x 5)

(define member?
  (lambda (x ls)
    (if (null? ls) #f (or (equal? x (car ls)) (member x (cdr ls))))
  )
)

;;(set-insert 5 '(1 2 3 )) => '(1 2 3 5)/'(5 1 2 3) order doesn't matter
;;(set-insert 5 '(1 2 3 4 5)) => '(1 2 3 4 5)
(define set-insert
  (lambda (x s)
    (if (member x s) s (cons x s))
  )
)

;;(union '(1 2 3) '(2 3 4)) => '(1 2 3 4)/'(2 3 4 1)/'(3 2 4 1)
(define union
  (lambda (s1 s2)
    (if
     (null? s1)
     s2
     (union (cdr s1) (set-insert (car s1) s2))
    )
  )
)

;;(contains s1 s2) gives #t if s1 is contained in s2
;;  and #f if s1 is not contained in s2
;;(contains? '(1 2 3) '(2 3 4 5 6)) => #f
;;(contains? '(1 2 3) '(3 2 1 200)) => #t
;;(contains? '() '(1 2 3)) => #t

;;always #t if (union s1 s2) equals s2
(define contains?
  (lambda (s1 s2)
    (cond ((null? s1) #t)
          ((eq? s2 (union s1 s2)) #t)
	  (else #f)
    )
  )
)


;;Checks if two sets are the same
;;(set-equals '(1 2 3) '(2 3 1)) => #t
;;(set-equals '(2 3 4) '(2 3 5)) => #f

;;(union s1 s2) should equal s1 and equal s2
(define set-equals
  (lambda (s1 s2)
    (if (eq? ((union s1 s2) s1))
	(if (eq? ((union s1 s2)) s2) #t)
	  #t)))
