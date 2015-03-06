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

