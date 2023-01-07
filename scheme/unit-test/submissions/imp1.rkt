(define fxn (lambda (x) x))

(define (my-sort ls)
   (letrec (
      (insert (lambda (x ls2)
         (if
	    (or (null? ls2) (< x (car ls2)))
	    (cons x ls2)
	    (cons (car ls2) (insert x (cdr ls2)))
	 )
      ))
   )
      (if
         (null? ls)
	 '()
	 (insert (car ls) (my-sort (cdr ls)))
      )
   )
   
)