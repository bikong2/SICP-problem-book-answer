#lang racket

(define (fringe items)
  (cond ((null? items) '())
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))))

;;test
(define x (list (list 1 2) (list 3 4)))

(fringe x)

(fringe (list x x))