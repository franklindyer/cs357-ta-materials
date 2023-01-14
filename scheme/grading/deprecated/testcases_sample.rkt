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

(+
   (run-graded-test 'fxn fxn-test-vals fxn-check #t)
   (run-graded-test 'my-sort sort-test-vals sort-check #t)
)