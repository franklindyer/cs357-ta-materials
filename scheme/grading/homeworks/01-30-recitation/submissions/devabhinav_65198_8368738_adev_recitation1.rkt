;; Abhinav Dev
;; Contains checks if s1 contains s2

(define member?
 (lambda (a s1)
  (if (null? s1) #f
   (or (equal? a (car s1)) (member? a (cdr s1))))


(define contains?
 (lambda (s1 s2)
  (if (null? s2) #t)
   (and (member? (car s2) (s1)) (contains? (s1) (cdr s2))))



(define set-equals?
 ( lambda (s1 s2)
 (if (contains (s1 s2)
  (and (equal? (length (s1)) (length (s2))))
 