#lang racket
;;Donny Jaramillo
(define member?
  (lambda (item ls)
    (if
     (null? ls)
     #f
    (if
     (equal? item (car ls))
     #t
     (member? item (cdr ls))))))
                             
    
(member? 3 '(1 2 3))

(define set-insert1
  (lambda (item set1)
    (if (null? set1) (cons item '())
        (if (member? item set1) set1 (cons item set1)))))

(define set-insert
  (lambda (x set1)
    (if (member? x set1) set1 (cons x set1))))

(set-insert 3 '(1 2))

(define union-two
  (lambda (set1 set2)
    (if (null? set1 ) set2 (set-insert (car set1) (union-two (cdr set1) set2)))
    )
  )
(union-two '(1 2) '(3 4))
;; I want to check if the set1 exists in set2 and return true using member throughout it
(define subset?
  (lambda (set1 set2)
    (if (null? set1) set2 (member? (car set1) (subset? (cdr set1) set2 )))))
;; I want to add them together and run member through the union because if they are indeed the same
;;they union will be themselves
(define set-equals?
  (lambda (set1 set2)
    (cond (null? set1) set2
        (union-two set1 set2)
        ( (member? set set2) #t))))

;;(subset? '(1 2) '(1 2))
;;(set-equals? '() '( 1))
                                                       