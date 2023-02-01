

;; CS 357, Spring 2023
;; Homework #1 skeleton

;; Problem 1.2
#|
a) 10500900
b) 2.5e-7
c) 'big-number
d) 'cat
e) 'cheshire
f) 10500900
g) 'big-number
h) 'number1
|#

;; Problem 1.3
#|
a) 4
b) 2/5
c) 2/3
d) 0.6666666666666667
|#

;; Problem 1.4
#|
a) (- (* 4 7) (+ 13 5))
b) (* 3 (+ 4 (- -5 -3)))
c) (/ 2.5 (* 5 (/ 1 10)))
d) (* 5 (+ 255(* 537 (+ 98.3 (- 375 (* 2.5 153))))))
|#

;; Problem 1.5
#|
a) a + ((B + r) - a)
b) (a * B) + (r * B)
c) (a - B) / (a - r)
|#

 (cons 'one (cons 'two (cons 'three(cons 'four '()))))
 (cons 'one (cons (cons 'two '())))
        
;; Problem 1.6
#|
a) 
b)
c)
d)
e)
|#

;; Problem 1.10
;; Your answer here

;; Problem 1.14
;; Your answer here

;; Problem 2.1
(define second 0)

;; Problem 2.3
;; Your answer here

;; Problem 2.4
(define juggle 0)

;; Problem 2.6
;; Your answer here

;; Problem 2.7
;; Your answer here

;; Problem 2.10
(define last-item 0)
(define member? 0)
(define remove-1st 0)

;; Problem 2.12
;; Your answer here

;; Problem 2.13
(define subst-1st 0)

;; Problem 2.14
(define insert-left-1st 0)

;; Problem 2.15
(define list-of-first-items 0)

;; Problem 2.16
(define replace 0)

;; Problem 2.18
(define remove-last 0)

;; Some test cases that will be used for grading:
;; (second '(1 2)) => 2
;; (second '(a b c d)) => 'b
;; (juggle '(jump quick spot)) => '(spot jump quick)
;; (juggle '(dog bites man)) => '(man dog bites)
;; (last-item '(a b c)) => 'c
;; (member? 'cat '(dog hen cat pig)) => #t
;; (member? 'fox '(dog hen cat pig)) => #f
;; (remove-1st 'fox '(hen fox chick cock)) => '(hen chick cock)
;; (subst-1st 'dog 'cat '(my cat is clever)) => '(my dog is clever)
;; (insert-left-1st 'hot 'dogs '(I eat dogs)) => '(I eat hot dogs)
;; (list-of-first-items '((a) (b c d) (e f))) => '(a b e)
;; (replace 'no '(will you do me a favor)) => '(no no no no no no)
;; (remove-last 'a '(b a n a n a s)) => '(b a n a n s)