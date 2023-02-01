(
 (subset? '(1 2 3) '(3 2 1 4))
 (lambda (ans) ans)
 3
 )

(
 (subset? '() '())
 (lambda (ans) ans)
 3
 )

(
 (subset? '(a b c d) '(a c e b f))
 (lambda (ans) (not ans))
 3
 )

(
 (subset? '(5 4 3) '())
 (lambda (ans) (not ans))
 3
 )

(
 (subset? '((1 2 3)) '((5 6 7) (1 2 3)))
 (lambda (ans) ans)
 3
 )

(
 (set-equals? '(1 2 3 4) '(1 2 3 4))
 (lambda (ans) ans)
 1
 )

(
 (set-equals? '() '())
 (lambda (ans) ans)
 1
 )

(
 (set-equals? '(1 2 3) '(3 2 1))
 (lambda (ans) ans)
 1
 )

(
 (set-equals? '(1 2 3 4 5 6 7) '(1 2 3 4 6 7))
 (lambda (ans) (not ans))
 1
 )

(
 (set-equals? '() '(()))
 (lambda (ans) (not ans))
 1
 )
