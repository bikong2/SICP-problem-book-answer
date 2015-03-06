#lang racket

(define (my-for-each f ls)
  (cond ((not (null? ls))
         (begin
           (f (car ls))
           (my-for-each f (cdr ls))))))

;;test
(for-each (lambda (x) (display x) (newline)) (list 57 321 88))
(my-for-each (lambda (x) (display x) (newline)) (list 57 321 88))