#lang racket

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2.0)
              (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2.0)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
;;rect
(define (make-rect x y width height)
  (cons x (cons y (cons width (cons height '())))))

(define (x-rect rect)
  (car rect))

(define (y-rect rect)
  (car (cdr rect)))

(define (width-rect rect)
  (car (cdr (cdr rect))))

(define (height-rect rect)
  (car (cdr (cdr (cdr rect)))))

(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))

(define (circumference-rect rect)
  (* 2 (+ (width-rect rect) (height-rect rect))))

;;test
(define rect (make-rect 0 0 3 4))
(area-rect rect)
(circumference-rect rect)