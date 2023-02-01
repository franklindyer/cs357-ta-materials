#lang racket
#1
define subset?
   (lambda (set1 set2)
     (for and set1)
     (member set2)
     
#2
define set-equals?
    (lambda (set1 set2)
      (subset set1 set2)
      (subset set2 set1)
      