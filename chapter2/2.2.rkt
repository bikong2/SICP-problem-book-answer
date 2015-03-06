#lang racket

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2.0)
              (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2.0)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

;;test
(define start (make-point -1 -1))
(define end (make-point 2 2))
(define seg (make-segment start end))
(print-point (start-segment seg))
(print-point (end-segment seg))
(print-point (midpoint-segment seg))