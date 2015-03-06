#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

;(define (sqrt x)
;  (fixed-point (average-damp (lambda (y) (/ x y)))
;             1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

(define (cube x) (* x x x))

(define (newton-transform g)
  (lambda (x) 
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;(define (sqrt x)
;  (newtons-method (lambda (y) (- (square y) x))
;                  1.0))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

;(newtons-method (cubic 1 2 3) 1)

(define (compose f g)
  (lambda (i) (f (g i))))

;((compose square inc) 6)

(define (repeated f n)
  (define (build counter)
    (if (< counter n)
        (compose f (build (+ counter 1)))
        (lambda (i) i)))
  (build 0))

;((repeated square 2) 5)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

;(repeated (smooth square) 10)

(define (n-root x n repeat-iter)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (expt y (- n 1))))) repeat-iter) 1.0))

(define k 5)
(n-root 1000000 k 10)
(expt (n-root 1000000 k 10) k)