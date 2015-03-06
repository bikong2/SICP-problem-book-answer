#lang scheme

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (make-vect x y) (cons x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cdr v))

(define (add-vect v w)
  (cons (+ (car v) (car w))
        (+ (cdr v) (cdr w))))

(define (sub-vect v w)
  (cons (- (car v) (car w))
        (- (cdr v) (cdr w))))

(define (scale-vect s v)
  (cons (* s (car v))
        (* s (cdr v))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (list-ref frame 0))

(define (edge1-frame frame) (list-ref frame 1))

(define (edge2-frame frame) (list-ref frame 2))

;;test
;(define origin-f (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(define a-frame (make-frame (make-vect 0 0) (make-vect 2 0) (make-vect 0 1)))
((frame-coord-map a-frame) (make-vect 0 0))