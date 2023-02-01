;;1/30 Lab - Andrew Potter

;;member?
;;Checks if element is in list, inserts if not
;;(set-insert 5 '(1 3 6 2) => '(5 1 3 6 2)
;;(set-insert 5 '(1 2 3 4 5)) => '(1 2 3 4 5)
(define member? 
    (lambda (item ls)
        (if (null? ls) #f 
            (or (equal? (car ls) item) 
                (member? item (cdr ls))))))

(define set-insert
    (lambda (x s)
        (if (member? x s) s 
            (cons x s))))

;;union
;;returns union of two sets, order unimportant
;;(union '(1 2) '(2 3)) => '(1 2 3) / '(2 1 3) / '(3 2 1) ...
(define union 
    (lambda (s1 s2)
        (if (null? s1) 
            s2
            (union (cdr s1) (set-insert (car s1) s2)))))

;;contains?
;;#t if every element in s1 is contained in s2, #f otherwise
(define contains? 
    (lambda (s1 s2) 
        (if (null? s1) 
            #t 
            (and (member? (car s1) s2) (contains? (cdr s1) s2)))))

;;set-equals?
;;checks if two sets are the same
(define set-equals? 
    (lambda (s1 s2)
        (and (contains? s1 s2) (contains? s2 s1))))