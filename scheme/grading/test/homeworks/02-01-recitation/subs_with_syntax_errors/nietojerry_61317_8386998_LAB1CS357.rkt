#lang racket

(define member?
  (lambda (x ls)
    (if(null? ls) #f if(equal? x (car ls)) #t (member? x (cdr ls)))
    )
  )

;;#1
(define subset?
  (lambda (set1 set2)
    (if (member? (car set1) set2) (if (member? (cdr set1 set2)) #t #f) #f)
    )
  )
)


;;#2
;;(set-equals? '(1 2 3) '(2 3 4 5) ==> #f
(define set-equals?
         (lambda (set1 set2)
           (if equal?( set1 set2) #t #f)
           ))
