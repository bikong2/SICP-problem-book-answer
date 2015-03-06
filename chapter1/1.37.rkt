#lang racket

;(define (cont-frac n d k)
;  (define (try counter result)
;    (if (> counter k)
;        result
;        (try (+ counter 1) (/ (n counter) (+ (d counter) result)))))
;  (try 1 0))

(define (cont-frac n d k)
  (define (try counter)
    (if (> counter k)
        0
        (/ (n counter) (+ (d counter) (try (+ counter 1))))))
  (try 1))


( / (cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               10))