(define x 3)


;;helper (from hw)
(define member?
  (lambda (item ls)
    (if(null? ls) ;;if list is empty, #f
      #f  
      (if (equal? (car ls) item) ;;else if list car(ls) = item
          #t ;;return #t
          (member? item (cdr ls))))))

    ;;set is a list with no duplicates
;;(set-insert 4 '(1 2 3)) -> ('4 1 2 3)
;;(set-insert 3 '(1 2 3)) -> ('1 2 3)  //won't add since it's already present
(define set-insert
  (lambda (x set1)
    (if(null? set1)
       (cons x '())
       (if(member? x set1)
          set1 (cons x set1)))))

;;(union-two '(1 2 3)(3 4 5)) -> '(1 2 3 4 5)
;;append without repeated elements
;;(union-two '() '(1 2 3)) -> '(1 2 3)
(define union-two
  (lambda (set1 set2)
    ;;recursion base case: null set w/ any other set
    (if(null? set1)
       set2
       (set-insert (car set1) (union-two (cdr set1) set2)))))
      ;;set-insert checks for dupes, recursively call union-two with cdr
      ;;union-two '(1 2 3) '(3 4 5)) -> set-insert 1 (union-two '(2 3) '(3 4 5))) -> '(1 2 3 4 5))
      ;;union-two '(2 3) '(3 4 5)) -> (set-insert 2(union-two '(3) '(3 4 5)))
      ;;union-two '(3) '(3 4 5)) -> (set-insert 3(union-two '() '(3 4 5))))
      ;;union-two'() '(3 4 5) -> '(3 4 5)

;;(subset? '(1 2 3) '(2 3 4 5)) -> #f
;;(subset? '(2 3) '(3 2 1)) -> #t
;;(subset? '() '(1 2 3)) -> #t ;;empty set is part of every set

;;if car set1 is in set2,
;;recursive call with cdr
(define subset?
  (lambda (set1 set2)
    ;;
    (if(null? set1) ;;if null set1 true 
       #t
       (if(member? (car set1) set2) ;;if is member,
          (subset? (cdr set1) set2)) ;;continue on w/ cdr
           #f)))
;;I have to say #t somewhere 


 ;;(set-equals? '(1 2 3) '(1 2 3 4) -> false
 ;;'(1 2 3) '(3 2 1) -> #t
 ;;checks if sets contain same numbers
;;(define set-equals?
;;  (lambda (set1 set2)