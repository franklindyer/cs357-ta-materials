;; Student who defined things with incorrect input/output types
(define (double x) (
   (cond
      ((= x 1) '())
      ((= x 2) #f)
      ((= x 3) (x x))
      (else 'foo)
   )
))

(define approx-pi "mayhem")
