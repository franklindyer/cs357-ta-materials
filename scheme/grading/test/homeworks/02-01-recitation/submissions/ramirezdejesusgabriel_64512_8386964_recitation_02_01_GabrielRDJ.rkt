#lang racket

(define member?
  (lambda (x ls)
    (if (null? ls)
	#f
	(if (equal? x (car ls))
	    #t
	    (member? (cdr ls)
	    )
         )
	)))

;; (set-insert 4 '(1 2 3)) ==> '(1 2 3 4) / '(4 1 2 3) / ...
;; (set-insert 3 '(1 2 3)) ==> '(1 2 3)
;; (set-insert 3 '()) ==> '(3)

(define set-insert
  (lambda (x set1)
;;    (if (null? set1) (cons x '()) (if (member? x set1) set1 (cons x set1)))
    (if (member? x set1) set1 (cons x set1))
  )
)

;; (union-two '(1 2 3) (3 4 5)) ==> '(1 2 3 4 5) / '(3 4 5 1 2) / ...
;; (union-two '() '(1 2 3)) ==> '(1 2 3)
;; (union-two '() '()) ==> '()
(define union-two
  (lambda (set1 set2)
    (if (null? set1) set2 (set-insert (car set1) (union-two (cdr set1) set2)))
  )
)

;; (union-two '(1 2 3) '(3 4 5)) ==> (set-insert 1 (union-two '(2 3) '(3 4 5))) ==> '(1 2 3 4 5)
;; (union-two '(2 3) '(3 4 5)) ==> (set-insert 2 (union-two '(3) '(3 4 5)))
;; (union-two '(3) '(3 4 5)) ==> (set-insert 3 (union-two '() '(3 4 5))) ==> '(3 4 5)
;; (union-two '() '(3 4 5)) ==> '(3 4 5)

;; (subset? '(1 2 3) '(2 3 4 5)) ==> #f
;; (subset? '(2 3) '(3 2 1)) ==> #t
;; (subset? '() '(1 2 3)) ==> #t

(define subset?
  (lambda (set1 set2)
    (if (member? (car set1) set2))    
  )
)

;; (set-equals?'(1 2 3) '(1 2 3 4) ==> #f
(define set-equals?
  (lambda (set1 set2)
    (if (equals? (set1 set2)
  )
))
