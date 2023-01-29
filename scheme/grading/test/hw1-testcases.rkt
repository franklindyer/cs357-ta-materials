(
    (second '(1 2))
    (lambda (ans) (= ans 2))
    1
)

(
    (second '(a b c d))
    (lambda (ans) (eq? ans 'b))
    1
)

(
    (second '(() () () () ()))
    (lambda (ans) (eq? ans '()))
    1
)

(
    (second '(() (1 2 3) (4 5 6)))
    (lambda (ans) (equal? ans '(1 2 3)))
    1
)

(
    (juggle '(jump quick spot))
    (lambda (ans) (equal? ans '(spot jump quick)))
    1
)

(
    (juggle '(dog bites man))
    (lambda (ans) (equal? ans '(man dog bites)))
    1
)

(
    (juggle '(1 2 3))
    (lambda (ans) (equal? ans '(3 1 2)))
    1
)

(
    (juggle '(a a a))
    (lambda (ans) (equal? ans '(a a a)))
    1
)

(
    (last-item '(a b c))
    (lambda (ans) (eq? ans 'c))
    1
)

(
    (last-item '(4))
    (lambda (ans) (= ans 4))
    1
)

(
    (last-item (letrec ((desc (lambda (x) (if (= x 0) '() (cons x (desc (- x 1))))))) (reverse (desc 50))))
    (lambda (ans) (= ans 50))
    1
)

(
    (last-item '(() (()) ((()))))
    (lambda (ans) (equal? ans '((()))))
    1
)

(
    (member? 'cat '(dog hen cat pig))
    (lambda (ans) ans)
    1
)

(
    (member? 'fox '(dog hen cat pig))
    (lambda (ans) (eq? ans #f))
    1
)

(
    (member? '(1 2) '((1 2) (3 4) (5 6)))
    (lambda (ans) ans)
    1
)

(
    (member? 51 (letrec ((desc (lambda (x) (if (= x 0) '() (cons x (desc (- x 1))))))) (reverse (desc 50))))
    (lambda (ans) (eq? ans #f))
    1
)

(
    (remove-1st 'fox '(hen fox chick cock))
    (lambda (ans) (equal? ans '(hen chick cock)))
    1
)

(
    (remove-1st 'fox '(hen chick cock))
    (lambda (ans) (equal? ans '(hen chick cock)))
    1
)

(
    (remove-1st 1 (remove-1st 2 (remove-1st 1 '(3 1 2 3 1 2))))
    (lambda (ans) (equal? ans '(3 3 2)))
    1
)

(
    (remove-1st '(a b c) '(a b c () (a b) (a b c)))
    (lambda (ans) (equal? ans '(a b c () (a b))))
    1
)

(
    (subst-1st 'dog 'cat '(my cat is clever))
    (lambda (ans) (equal? ans '(my dog is clever)))
    1
)

(
    (subst-1st 4 '(1 2 3) '(1 2 3 (1 2 3)))
    (lambda (ans) (equal? ans '(1 2 3 4)))
    1
)

(
    (subst-1st 'x 'y '(a b c))
    (lambda (ans) (equal? ans '(a b c)))
    1
)

(
    (subst-1st '() 'b '(a b c d))
    (lambda (ans) (equal? ans '(a () c d)))
    1
)

(
    (insert-left-1st 'hot 'dogs '(I eat dogs))
    (lambda (ans) (equal? ans '(I eat hot dogs)))
    1
)

(
    (insert-left-1st 'b 'y '(a b c))
    (lambda (ans) (equal? ans '(a b c)))
    1
)

(
    (insert-left-1st 'y 'b '(a b c))
    (lambda (ans) (equal? ans '(a y b c)))
    1
)

(
    (insert-left-1st 'y 'b '(a b b b b b))
    (lambda (ans) (equal? ans '(a y b b b b b)))
    1
)

(
    (list-of-first-items '((a) (b c d) (e f)))
    (lambda (ans) (equal? ans '(a b e)))
    1
)

(
    (list-of-first-items '((1) (2) (3) (4)))
    (lambda (ans) (equal? ans '(1 2 3 4)))
    1
)

(
    (list-of-first-items '((())))
    (lambda (ans) (equal? ans '(())))
    1
)

(
    (list-of-first-items '((10 9 8 7 6 5)))
    (lambda (ans) (equal? ans '(10)))
    1
)

(
    (replace 'no '(will you do me a favor))
    (lambda (ans) (equal? ans '(no no no no no no)))
    1
)

(
    (replace 'no '())
    (lambda (ans) (eq? ans '()))
    1
)

(
    (replace '(a b) '(1 2 3))
    (lambda (ans) (equal? ans '((a b) (a b) (a b))))
    1
)

(
    (replace 1 '(a))
    (lambda (ans) (equal? ans '(1)))
    1
)

(
    (remove-last 'a '(b a n a n a s))
    (lambda (ans) (equal? ans '(b a n a n s)))
    1
)

(
    (remove-last 'x '(b a n a n a s))
    (lambda (ans) (equal? ans '(b a n a n a s)))
    1
)

(
    (remove-last 'x '(x x x y x x))
    (lambda (ans) (equal? ans '(x x x y x)))
    1
)

(
    (remove-last 1 '(1 2 3 4 3 2 1))
    (lambda (ans) (equal? ans '(1 2 3 4 3 2)))
    1
)
