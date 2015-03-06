#lang racket

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-2 items)
  (map square items))

;;test
(map abs (list -10 2.5 -11.6 17))
(map (lambda (x) (* x 10)) (list 1 2 3 4 5))

(square-list (list 1 2 3 4))
(square-list-2 (list 1 2 3 4))