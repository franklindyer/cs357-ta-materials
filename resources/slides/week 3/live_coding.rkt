;; (wrap 1) => (1)
;; (wrap '(1)) => (1)
(define wrap
  (lambda (x)
    (if (pair? x)
        x
        (list x))))

(define deep-times
  (lambda (ls)
    (cond ((null? ls) 1)
          ((pair? (car ls))
           (* (deep-times (car ls))
              (deep-times (cdr ls))))
          (else
           (* (car ls)
              (deep-times (cdr ls)))))))

(define deep-times
  (lambda (sexpr)
    (cond ((null? sexpr) 1)
          ((pair? sexpr)
           (* (deep-times (car sexpr))
              (deep-times (cdr sexpr))))
          (else

;; (flatten '(1 (2 3) (4) 5)) => '(1 2 3 4 5)
;; (flatten '(1 ((((2 3)))) (4) 5)) => '(1 (((2 3))) 4 5)
(define flatten
  (lambda (ls)
    (if (null? ls)
        '()
        (append (wrap (car ls))
                (flatten (cdr ls))))))

;; (flatten-all '(1 ((((2 3)))) (4) 5)) => '(1 2 3 4 5)
(define flatten-all
  (lambda (ls)
    (cond ((null? ls) '())
          ((pair? (car ls))
           (append (flatten-all (car ls))
                   (flatten-all (cdr ls))))
          (else
           (cons (car ls)
                 (flatten-all (cdr ls)))))))
