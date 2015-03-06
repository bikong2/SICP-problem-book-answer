#lang racket
(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g)
  (lambda (i) (f (g i))))

;((compose square inc) 6)

(define (repeated f n)
  (define (build counter)
    (if (< counter n)
        (compose f (build (+ counter 1)))
        (lambda (i) i)))
  (build 0))

;((repeated square 2) 5)

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(repeated (smooth square) 10)