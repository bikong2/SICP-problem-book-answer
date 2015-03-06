#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a 0.0) n))
  (define (g x) (+ a (* x h)))
  (define (s-term k)
    (cond ((or (= k 0) (= k n)) (f (g k)))
          ((odd? k) (* 4 (f (g k))))
          ((even? k) (* 2 (f (g k))))))
  (define (s-next k) (+ k 1))
  
  (* (/ h 3) (sum s-term 0 s-next n)))

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
