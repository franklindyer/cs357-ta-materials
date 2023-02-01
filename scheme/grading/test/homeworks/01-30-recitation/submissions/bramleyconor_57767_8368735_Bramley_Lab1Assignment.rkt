Welcome to Racket v7.5.

>  #lang racket

;; member?, length, odd, even, merge


;; we'll represent sets as lists with non-repeated elements

;; Rewrite member? function
(define member?
   (lambda (x ls)
     (if (null? ls)  
          #f
          (or (equal? x (car ls)) member? x (cdr? ls))))
;; (set-insert 5 '(1 2 3)) => ;(1 2 3 4 5)
;; (set-insert 5 ;(1 2 3 4 5) => '(1 2 3 4 5)
(define set-insert
   (lambda (x s)
     (if (member? x s) s (cons x s))

  )
)

;; (union ;(1 2 3) ;(2 3 4)) => ; (1 2 3 4) / '(2 3 4 1) / '(3 2 4 1)
(define union
    (lambda (s1 s2)
      (if 
        (null? s1) 
        s2

        (union (cdr s1) (set-insert (car s1) s2) )
   )
) 

;;(union '(27 28 29)m'(2 3 4))
;; ( union '(28 29) (set-insert 29 '(2 3 4)))
;; ( union '(28 29) ' (29 2 3 4))
;; ( union (29) ( set-insert 28 '(29 2 3 4)))

  
;;Sorry counldn't get 1 done but I started 2 hopefully it kind of works.
;; 1. contains?
;; (contains s1 s2) should give #t if s1 is contained in s2
;; and #f is s1 is not contained in s2
(constains? '(1 2 3) '(2 3 4 5 6)) => #f
;; (contains? '(1 2 3) '(3 2 1 200)) => #t
(define (contains? s1 lst)
 
  
;; 2. set-equals?
;;checks if two sets are the same
(set-equals '(1 2 3) '(2 3 1)) => #t
;;(set_equals ' (2 3 4) '(2 3 5)) => #f
  (define ( set-equals? s1 s2)
    (and(not(null? s1))
        (or(member ( car s1) s2)
           (set-equals? ( cdr s1) s2))))