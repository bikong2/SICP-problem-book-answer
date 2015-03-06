#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "guess: ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

;(fixed-point (lambda (y) (+ 1 (/ y))) 1.0)
;(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.5) 
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.5)