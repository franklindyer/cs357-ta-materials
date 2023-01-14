;; Student who defined things that would cause infinite loops upon evaluation
(define (double x) (+ 0 (double x)))

(define approx-pi 3.14159)
