#lang racket
(define x 3)
(define y 4)

(define member?
  (lambda(x ls)
    (if (null? ls)
      #f
      (or (equal? x (car ls)) (member? x (cdr ls))))))


;; (set-insert 5 '(1 2 3)) => '(1 2 3 5)
;; (set-insert 5 '(1 2 3 4 5)) => '(1 2 3 4 5)
(define set-insert
  (lambda (x s)
    (if (member? x s)
      s
      (cons x s))))

;; (union '(1 2 3) '(2 3 4)) ==> '(1 2 3 4)/ '(2 3 4 1)/ '(3 2 4 1)        
(define union
  (lambda (s1 s2)
    (if (null? s1)
      s2
      (union (cdr s1) (set-insert (car s1) s2)))))


;; 1. contains?  take 2 arguments 2 list
;; (contains s1 s2) should give #t if s1 is contained in s2
;; #f is s1 is not contained in s2
(define contains
  (lambda (s1 s2)
    (cond ((null? s1) #f)
          ((null? s2) #f)
    )
  )
)
53;; (set-equals '(1 2 3) '(2 3 1)) => #t                                                                     
54;; (set-equals '(2 3 4) '(2 3 5)) => #f
(define set-equals
  (lambda (s1 s2)
    (cond ((null? s1) #f)
          ((null? s2) #f)
    )
  )
)