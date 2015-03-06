#lang racket

;(define (sum term a next b)
;  (if (> a b)
;      0
;      (+ (term a) (sum term (next a) next b))))

;(define (sum term a next b)
;  (define (iter a result)
;    (if (> a b)
;        result
;        (iter (next a) (+ result (term a)))))
;  (iter a 0))

;(define (product term a next b)
;  (if (> a b)
;      1
;      (* (term a) (product term (next a) next b))))

;(define (product term a next b)
;  (define (iter a result)
;    (if (> a b)
;        result
;        (iter (next a) (* result (term a)))))
;  (iter a 1))

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

; test
(define (cube x) (* x x x))

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

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

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