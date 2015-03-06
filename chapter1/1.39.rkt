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

(define (tan-cf x k)
  (define (d i)
    (- (* 2 i) 1))
  (define (n i)
    (if (= i 1)
        x
        (* x x)))
  (define (try counter)
    (if (> counter k)
        0
        (/ (n counter) (- (d counter) (try (+ counter 1))))))
  (+ 0.0 (try 1)))

(tan-cf 1 100)