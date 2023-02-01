;;Austyn Mitchev

(define member?
  (lambda (x ls)
    (if
      (null? ls)
      #f
      (or (equal? x (car ls)) (member? x (cdr ls))))))
(define set-insert
  (lambda (x s)
    (if (member? x s) s
        (cons x s)
        )))
    

(define union
  (lambda (s1 s2)
    (if
     (null? s1)
     s2
     (union (cdr s1) (set-insert (car s1) s2))))
   )

;; Recitation/Lab Assignment
;;1: Write a function called 'contains? (s1 s2)'
;;  i.e: (contains? s1 s2) should give #t if s1 is contained in s2
;;2: Write a function called 'set-equals? (s1 s2)' that checks if
;;   two sets are the same
;;  i.e: (set-equals '(1 2 3) '(2 3 1)) => #t

(define contains?
  (lambda (s1 s2)
    (if (null? s1)
      #t
    (equal? (union s1 s2) s2))))
;;Couldn't finish set-equals?