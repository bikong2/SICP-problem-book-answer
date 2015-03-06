;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (sqrt-3 x)
  (sqrt-iter  0.0 1.0 x))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess (improve guess x)
                 x)))


(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (good-enough? old-guess guess)
  (< (/ (change guess old-guess) guess) 0.001))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (change guess old-guess) (abs (- guess old-guess)))

; test
(define x 216)
(define y (sqrt-3 x))
y
(- (cube y) x)