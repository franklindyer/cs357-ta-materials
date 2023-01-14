(load "testing_utils.rkt")

(define (zip l1 l2)
   (letrec (
      (zipcum (lambda (l3 l4 acc)
         (if
	    (or (null? l3) (null? l4))
	    acc
	    (zipcum (cdr l3) (cdr l4) (cons (cons (car l3) (car l4)) acc))
	 )
      ))
   )
   (reverse (zipcum l1 l2 '()))
))

(define fxn-test-vals
   '(
      ((0) . 3)
      ((1) . 3)
      ((2) . 3)
      ((3) . 3)
      ((50) . 1)
    )
)

(define fxn-check
   (lambda (x y) (= y 0))
)

(define sort-test-vals
   '(
      (((5 4 3 2 1)) . 2)
      (((3 5 4 1 2)) . 2)
      (((420 69 421)) . 2)
      ((()) . 1)
   )
)

(define sort-check
   (cases-test '(
      (((5 4 3 2 1)) . (1 2 3 4 5))
      (((3 5 4 1 2)) . (1 2 3 4 5))
      (((420 69 421)) . (69 420 421))
      ((()) . ())
   ))
)

;; Grading the grader!

(define grading-inputs
   (map (lambda (l) (map eval l))
   '(
      ("imp1.rkt" 'fxn fxn-test-vals fxn-check #f)
      ("imp2.rkt" 'fxn fxn-test-vals fxn-check #f)
      ("imp3.rkt" 'fxn fxn-test-vals fxn-check #f)
      ("imp1.rkt" 'my-sort sort-test-vals sort-check #f)
      ("imp2.rkt" 'my-sort sort-test-vals sort-check #f)
      ("imp3.rkt" 'my-sort sort-test-vals sort-check #f)
   ))
)

(define grading-pts '(1 1 1 2 2 2))

(define grading-out '(3 13 12 7 4 1))

(define grading-test-vals (zip grading-inputs grading-pts))

(define grading-check (cases-test (zip grading-inputs grading-out)))

(run-graded-test grade-external grading-test-vals grading-check #t)



