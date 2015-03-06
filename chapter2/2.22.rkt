#lang racket

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (reverse(iter items '())))

;;test
(square-list (list 1 3 5 7))
