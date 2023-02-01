#lang racket

(define member?
    (lambda (x ls)
        (if(null? ls)
            #f
            (if(equal? x (car ls))
                #t
                (member? x (cdr ls))))))


;;; (display(member? 1 '(1 2 3)))

(define subset?
    (lambda (set1 set2)
        (or (null? set1)
            (and (member? (car set1) set2)
                (subset? (cdr set1) set2)))))

;;; (display(subset? '(1 2 5) '(1 2 3 4)))


;;; (define set-equal?
;;;     (lambda (set1 set2)
;;;         (cond
;;;             ((null? (cdr set1) (member? set1 set2))
;;;             ((member? (car set1) set2) (set-equal? (cdr set1) set2))
;;;             (else #f)))))




(define set-equal?
    (lambda (set1 set2)
        (if ((null? (cdr set1) 
            (member? set1 set2))
            ((member? (car set1) set2) (set-equal? (cdr set1) set2))
            #f))))


(display(set-equal? '(1 2 5) '(5 2 1)))