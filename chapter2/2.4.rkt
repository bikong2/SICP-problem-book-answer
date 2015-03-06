#lang racket

;(define (cons x y)
;  (define (dispatch m)
;    (cond ((= m 0) x)
;          ((= m 1) y)
;          (else (error "Argument not 0 or 1 -- CONS" m))))
;  dispatch)
;
;(define (car z) (z 0))
;
;(define (cdr z) (z 1))

(define (cons x y)
  (lambda (m) (m x y))) ; the parameter m is a procedure, m receives two parameters x y from cons

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;;test
(define c (cons 1 2))
(car c)
(cdr c)