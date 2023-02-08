(define interval
  (lambda (n)
    (cond
     ((= n 0) '())
     (else (cons n (interval (- n 1)))))))

(define ls1 (interval 10000000))

(define sum
  (lambda (ls)
    (cond
     ((null? ls) 0)
     (else (+ (car ls) (sum (cdr ls)))))))

(define sum-it
  (lambda (ls acc)
    (cond
     ((null? ls) acc)
     (else (sum-it (cdr ls) (+ (car ls) acc))))))

(time (sum ls1))
(time (sum-it ls1 0))

(define myappend
  (lambda (ls1 ls2)
    (cond
     ((null? ls1) ls1)
     (else (cons (car ls1) (myappend (cdr ls1) ls2))))))

(define myappend-it
  (lambda (ls1 ls2)
    (cond
     ((null? ls1) ls2)
     (else (myappend-it (cdr ls1) (cons (car ls1) ls2))))))

(define myappend2
  (lambda (ls1 ls2)
    (myappend-it (reverse ls1) ls2)))

(time (let ((wot (myappend ls1 ls1))) 1))
(time (let ((wot (myappend2 ls1 ls1))) 1))

;; Participation:
;; Write a tail recursive
;; function 'interval-it' and define
;; a function 'interval2' with the same functionaly
;; of the 'interval' function discussed during recitation.
;; Test with the function 'sum' that the sum of the
;; first 100 number add up to 5050.
