#lang racket

(require racket/sandbox)
(require racket/format)
(define-namespace-anchor nsa)
(define ns (namespace-anchor->namespace nsa))

(define (new-hw-evaluator)
(parameterize (
      [sandbox-propagate-exceptions #f]
      [sandbox-propagate-breaks #f]
      [sandbox-error-output #f]
      [sandbox-eval-limits '(0.5 #f)]
      [sandbox-memory-limit #f]
      ;; [sandbox-exit-handler (lambda (c) (void))]
   )
   (make-evaluator 'racket/base)
))

(define (hw-sandbox-port ev prt)
   (let (
      (ob (read prt))
   ) (if
      (eof-object? ob)
      #t
      (begin (ev ob) (hw-sandbox-port ev prt))
   ))
)

(define (hw-sandbox-file ev filename)
   (let
      ((prt (open-input-file filename)))
      (hw-sandbox-port ev prt)
   )
)

(define (run-test-case tc ev)
   (let* (
      (expr (car tc))
      (pred (eval (cadr tc) ns))
      (pts (caddr tc))
      (maybe-val (ev expr))
      (maybe-test (with-handlers
         ([exn:fail? (lambda (e) (void))])
         (pred maybe-val)
      ))
      (invalid (or (void? maybe-val) (void? maybe-test)))
   )
   (cond
      (invalid (cons 0 "TEST FAILED: evaluation resulted in error or took too long\n"))
      (maybe-test (cons pts "TEST PASSED!\n"))
      (else (cons 0 "TEST FAILED: incorrect value\n"))
   )
))

(define (run-tests-from-port prt ev pts text)
   (let ((next (read prt)))
      (if 
         (eof-object? next)
         (cons pts text)
         (let ((test-res (run-test-case next ev)))
            (run-tests-from-port
               prt
               ev
               (+ pts (car test-res))
               (string-append 
                  text
                  "Test case: "
                  (~v (car next))
                  "\n"
                  (cdr test-res)
               )
            )
         )
      )
   )
)

(define (run-tests-from-file filename ev)
   (let* (
      (prt (open-input-file filename))
      (results (run-tests-from-port prt ev 0 "BEGINNING OF TESTING\n---\n"))
   )
   (begin
      (display (cdr results))
      (car results)
   )
))

(define clargs (current-command-line-arguments))
(define hw-filename (vector-ref clargs 1))
(define tc-filename (vector-ref clargs 0))
(define hw-eval (new-hw-evaluator))
(hw-sandbox-file hw-eval hw-filename)

(run-tests-from-file tc-filename hw-eval)
