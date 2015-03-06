;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (sqrt-newton x)
  (sqrt-iter  0.0 1.0 x))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess guess)
  (< (/ (change guess old-guess) guess) 0.001))

(define (square x) (* x x))

(define (change guess old-guess) (abs (- guess old-guess)))

; test

(define x 10000000)
(define y (sqrt-newton x))
x
y
(- (square y) x)