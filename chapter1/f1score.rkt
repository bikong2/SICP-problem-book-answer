#lang racket
(define f1score
  (lambda (p r)
    (* 2 (/ (* p r) (+ p r)))))

(f1score 0.5 0.4)
(f1score 0.7 0.1)
(f1score 0.02 1.0)