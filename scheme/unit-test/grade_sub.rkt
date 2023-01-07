#lang racket

(define args (current-command-line-arguments))

(define testcases (vector-ref args 0))
(define filename (vector-ref args 1))

(parameterize ([current-namespace (make-base-namespace)])
   (load "testing_utils.rkt")
   (load filename)
   (load testcases)
)