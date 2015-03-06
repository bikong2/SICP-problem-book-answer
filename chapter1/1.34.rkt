#lang racket

(define (f g)
  (g 2))


(f (lambda (z) (* z z)))
(f (lambda (z) (* z (+ z 1))))

(f f)