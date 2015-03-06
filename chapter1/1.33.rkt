#lang racket

;;prime
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n extra)
  (if (< n 2)
      #f
      (= n (smallest-divisor n))))

;;accumulate
;(define (accumulate combiner null-value term a next b)
;  (if (> a b)
;      null-value
;      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;; gcd
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (coprime? i n)
  (if (and (< i n) (= (gcd i n) 1))
      #t
      #f))

;; filtered-accumulate
(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a b)
          (combiner (term a) (filtered-accumulate combiner null-value filter term (next a) next b))
          (combiner null-value (filtered-accumulate combiner null-value filter term (next a) next b)))))

(filtered-accumulate + 0 prime? (lambda (x) x) 0 (lambda (x) (+ x 1)) 10)
(filtered-accumulate * 1 coprime? (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)