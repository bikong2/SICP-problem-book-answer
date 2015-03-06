#lang racket

(define (cons int) int)

(define (car z)
  (define (iter temp result)
    (if (= (remainder temp 2) 0)
        (iter (/ temp 2) (+ 1 result))
        result))
  (iter z 0))

(define (cdr z)
  (define (iter temp result)
    (if (= (remainder temp 3) 0)
        (iter (/ temp 3) (+ 1 result))
        result))
  (iter z 0))

;;test
(define z (cons 576))
(car z)
(cdr z)