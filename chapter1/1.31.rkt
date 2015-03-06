#lang racket

;(define (sum term a next b)
;  (if (> a b)
;      0
;      (+ (term a) (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;(define (product term a next b)
;  (if (> a b)
;      1
;      (* (term a) (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-test a b)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (product identity a inc b))

(define (factorial n)
  (if (= n 0)
      1
      (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n)))

(define (john-willis a b)
  (define (jw-term a)
    (/ (* a (+ a 2)) (*(+ a 1) (+ a 1))))
  (define (jw-next a)
    (+ a 2))
  (* 4.0 (product jw-term a jw-next b)))

(factorial 0)
(factorial 10)
(john-willis 2 1000)
        
          
