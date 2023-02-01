#lang racket

(define x 3)

(define member?
  (lambda (item ls)
    (if (null? ls)
        #f
        (or (equal? (car ls) item)
            (member? item (cdr ls))))))

(define set-insert
  (lambda (x set1)
    (if (member? x set1) set1 (cons x set1))))

(set-insert 4 '(1 2 3 4 5))
(set-insert 4 '(1 2 3))

(define union-two
  (lambda (set1 set2)
    (if(null? set1) set2 (set-insert (car set1) (union-two (cdr set1) set2)))
  )
)

;; (subset? '(1 2 3) '(2 3 4 5)) ==> #f
;; (subset? '(2 3) '(3 2 1)) ==> #t
;; (subset? '() '(1 2 3)) ==> #t
(define subset?
  (lambda (set1 set2)
    (if (null? set1)
        #t
        (and (member? (car set1) set2)
             (subset? (cdr set1) set2)))))


;; #2
;; (set-equals? '(1 2 3) '(1 2 3 4)) ==> #f
;; (set-equals? '(1 2 3) '(3 2 1))==> #t
;; (set-equals? '(1 2 3) '(2 1 3)) ==> #t
;; (set-equals? '() '(1)) ==> #f
(define set-equals?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1)

  )
))