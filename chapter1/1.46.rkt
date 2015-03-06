#lang racket

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (iterative-improve good-enough? improve)
  (define (f guess x)
    (if (good-enough? guess x)
        guess
        (f (improve guess x) x)))
  f)

(define sqrt (iterative-improve sqrt-good-enough? sqrt-improve))

(sqrt 1.0 3)