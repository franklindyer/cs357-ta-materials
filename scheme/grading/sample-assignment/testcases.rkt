(
    (double 1)
    (lambda (ans) (= ans 2))
    1
)

(
    (double 2)
    (lambda (ans) (= ans 4))
    1
)

(
    (double 3)
    (lambda (ans) (= ans 6))
    1
)

(
    approx-pi
    (lambda (ans) (< (abs (- ans pi)) 0.001))
    1
)
