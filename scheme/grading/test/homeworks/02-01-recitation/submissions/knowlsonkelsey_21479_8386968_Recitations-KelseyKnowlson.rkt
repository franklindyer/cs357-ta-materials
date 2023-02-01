(print-as-expression #f)
(define union-two
  (lambda (set1 set2)
    (if (null? set1)
        set2 (set-insert(car set1) (union-two (cdr set1) set2)))))

(define member?
  (lambda (item ls)
    (if (null? ls)
	#f
	(if (equal? item (car ls))
            #t
            (member? item (cdr ls))))))
(define set-insert
  (lambda (x s)
    (if (member? x s )
        s
        (cons x s))))
(define subset?
  (lambda (ls set2)
    (if(member? (car ls) set2)
       (if (null? (cdr ls))
           #t
           (subset? (cdr ls) set2))
    #f)))

  (define set-equals?
  (lambda (set1 set2)
    (if(null? set1)
       #f
       (if(member? (car set1) set2)
          (if(null? (cdr set1))
             #f
             (set-equals? (cdr set1) set2))
          #f))
    (and (equal? (length set1) (length set2)))
            )
          )
        
    (define length
  (lambda (ls)
    (if (null? ls)
	0
	(+ 1 (length (cdr ls))))))