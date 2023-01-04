(define (display-test-output f testcase)
  (begin
    (display "Args: ")
    (display testcase)
    (display "\nOutput: ")
    (display (apply f testcase))
    (display "\n\n")
  )
)

;; A test consists of:
;; - a function
;; - a list of lists of test input values
;; - a function to test correctness
(define (run-unit-test f ins utest v)
  (letrec
    (
      (cum-unit-test
        (lambda (passed f ins)
	  (if (empty? ins)
	    (begin
	      (display (if v "End of testing.\n" ""))
	      passed
	    )
	    (if (utest (car ins) (apply f (car ins)))
	      (begin
	        (if v (display-test-output f (car ins)) (display ""))
		(cum-unit-test (cons #t passed) f (cdr ins))
	      )
	      (begin
		(if v (display-test-output f (car ins)) (display ""))
		(cum-unit-test (cons #f passed) f (cdr ins))
	      )
	    ))))
    )
    (reverse (cum-unit-test '() f ins))))

(define (filter-inds bools vals)
	(cond ((or (null? bools) (null? vals))
	          '())
	      ((car bools)
	         (cons (car vals) (filter-inds (cdr bools) (cdr vals))))
	      (else
	         (filter-inds (cdr bools) (cdr vals)))))

(define (run-graded-test f ins-pts utest v)
	(let*
	   (
	      (passed (run-unit-test f (map car ins-pts) utest v))
	      (outof (apply + (map cdr ins-pts)))
	      (score (apply + (filter-inds passed (map cdr ins-pts))))
	   )
	   (begin
	      (display "Summary:\n")
	      (display "Tests passed: ")
	      (display passed)
	      (display "\n")
	      (display "Score: ")
	      (display score)
	      (display "/")
	      (display outof)
	      (display "\n")
	      score
	   )))

;; Given the following arguments:
;; - the name of a file
;; - the name of a function (as data)
;; - a list of test inputs with associated point values in pairs
;; - a two-argument predicate
;; this routine will import the function from the specified file
;;   and test it with the given inputs, checking correctness
;;   according to the provided predicate
(define (grade-external filename name-f ins-pts utest v)
   (begin
      (load filename)
      (define f (eval name-f))
      (run-graded-test f ins-pts utest v)
))

(define (cases-test ins-outs)
   (lambda (x y)
      (cond
         ((null? ins-outs) #f)
      	 ((equal? x (caar ins-outs)) (equal? y (cdar ins-outs))) 
	 (else ((cases-test (cdr ins-outs)) x y)))
   )
)