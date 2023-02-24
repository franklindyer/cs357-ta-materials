#lang racket
;; Map and high orders functions, a bit of apply at the end

;;;; Recursive definition of map

(define mymap
  (lambda (f ls)
    (if (null? ls)
	'()
	(cons
	 (f (car ls))
	 (mymap f (cdr ls))))))

;;;; (map f) . (map g) \equiv (map (compose f g))

;;;; Examples using map

(mymap
 (lambda (x) (* x x))
 '(1 2 3 4))

(mymap
 (lambda (x) (+ x 1))

 (mymap
  (lambda (x) (* x x))
  '(1 2 3 4)))

(mymap
 (lambda (x) (+ (* x x) 1))
 '(1 2 3 4))

;;;; More examples using map

(define student_database
  '(
    ;; (name . (grade . is_cool?))
    ("James"   . (0 . #t))
    ("Jack"    . (1 . #f))
    ("Jackson" . (2 . #f))
    ("Jacob"   . (3 . #f))
    ("John"    . (4 . #t))
    ("Joseph"  . (5 . #f))
    ("Julian"  . (6 . #f))
    ("Jayden"  . (7 . #t))
    ("Josiah"  . (8 . #t))
    ("Jaxon"   . (9 . #f))))

(define new_student
  (lambda (name grade is_cool)
    (cons name (cons grade is_cool))))

(define get_name
  (lambda (student)
    (car student)))

(define get_grade
  (lambda (student)
    (cadr student)))

(define get_coolness
  (lambda (student)
    (cddr student)))

(define boring_get_grades
  (lambda (student_records)
    (if (null? student_records)
      '()
      (cons
       (get_grade (car student_records))
       (boring_get_grades (cdr student_records))))))

(define get_grades
  (lambda (student_records)
    (mymap get_grade student_records)))

(define made_up_grades
  (lambda (ls n)
    (mymap

     (lambda (student)
       (let ((name (get_name student))
	     (is_cool (get_coolness student)))
	 (new_student name n is_cool)))

     ls)))

(made_up_grades student_database 100)

(define compute_average_wow_much_abstraction
  (lambda (student_records)
    (let ((total
	   (apply +
		  (get_grades student_records)))
	  (size
	   (apply +
		  (get_grades (made_up_grades student_records 1)))))
      (/ total size))))

(compute_average_wow_much_abstraction student_database)

;;;; Remember: (map f) . (map g) \equiv (map (compose f g))

(define compute_average
  (lambda (student_records)
    (let ((total (apply +
			(mymap get_grade student_records)))
	  (size  (apply +
			(mymap (lambda (x) 1) student_records))))
      (/ total size))))

(compute_average student_database)

;; Could I have used length instead? Yes, actually.

;; Recitation activity

;; 1. Create a function everyone_is_cool that
;; takes as input:
;; - a list of student records `student_records` as described above
;; and returns the same list of student records setting
;; up the record is_cool to #t using map or mymap

(define everyone_is_cool
  (lambda (student_records)
    0))

;; 2. Create a function compute_final_average that
;; takes as input:
;; - a list of student records `student_records` as described above
;; and returns the average grade of students using the following criteria
;; if the student's is_cool record is #t, add 2 points to its grade
;; otherwise subtract 1 point to its grade

(define compute_final_average
  (lambda (student_records)
    0))
