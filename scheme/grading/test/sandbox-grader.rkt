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

;; Update evaluator ev with
;; next datum in prt
(define (hw-sandbox-port ev prt)
  (let*
      ((ob (with-handlers
             ([exn:fail? (lambda (e) (void))])
             (read prt))))

    (cond
      ;; TODO(?):
      ;; Add more cases regarding
      ;; state of ob if needed
      ((void? ob) #f)
      ((eof-object? ob) #t)
      (else (begin (ev ob) (hw-sandbox-port ev prt))))))

;; Update evaluator ev with datums
;; in filename
(define (hw-sandbox-file ev filename)
   (let
      ((prt (open-input-file filename)))
      (hw-sandbox-port ev prt)
   )
)

;; Return (cons pts msg) using evaluator ev
;; where:
;; - pts is a number indicating points obtained from test
;; - msg is a string providing feedback
(define (run-test-case test-obj ev)
   (let* (
      (expr-to-test (car test-obj))
      (test-handler (eval (cadr test-obj) ns))
      (pts (caddr test-obj))
      (maybe-val (ev expr-to-test))
      (maybe-test (with-handlers
         ([exn:fail? (lambda (e) (void))])
         (test-handler maybe-val)
      ))
      (invalid (or (void? maybe-val) (void? maybe-test)))
   )
   (cond
     (invalid
      (cons
       0
       "TEST FAILED: evaluation resulted in error or took too long\n"))
     (maybe-test
      (cons
       pts
       "TEST PASSED!\n"))
     (else
      (cons
       0
       "TEST FAILED: incorrect value\n"))
   )
))

;; Return (cons pts msg) using evaluator ev
;; where:
;; - pts is a number indicating cumulative
;;   points obtained from testing port prt
;; - msg is a string providing cumulative
;;   feedback obtained from testing port prt
(define (run-tests-from-port prt ev pts text)
   (let ((curr-test-obj (read prt)))
      (if 
         (eof-object? curr-test-obj)
         (cons pts text)
         (let ((test-res (run-test-case curr-test-obj ev)))
            (run-tests-from-port
               prt
               ev
               (+ pts (car test-res))
               (string-append 
                  text
                  "Test case: "
                  (~v (car curr-test-obj))
                  "\n"
                  (cdr test-res)
               )
            )
         )
      )
   )
)

;; Return pts which is a number indicating
;; cumulative points obtained from testing
;; filename test-filename using evaluator ev
;; Side effect: displays report on feedback-filename
(define (run-tests-from-file test-filename feedback-filename ev)
   (let* (
      (prt (open-input-file test-filename))
      (out (open-output-file feedback-filename #:exists 'replace))
      (results (run-tests-from-port prt ev 0 "BEGINNING OF TESTING\n---\n"))
   )
   (begin
      (display (cdr results) out)
      (display (car results) out)
      (close-output-port out)
      (car results)
   )
))

(define clargs (current-command-line-arguments))
(define hw-filename (vector-ref clargs 1))
(define tc-filename (vector-ref clargs 0))
(define hw-eval (new-hw-evaluator))
(define submission-without-syntax-errors (hw-sandbox-file hw-eval hw-filename))
(define feedback-filename
  (let ((basename (vector-ref clargs 2)))
    (if submission-without-syntax-errors
        basename
        (string-append basename "-with-syntax-errors.rkt"))))

(run-tests-from-file tc-filename feedback-filename hw-eval)
(if submission-without-syntax-errors (exit 0) (exit 1))
