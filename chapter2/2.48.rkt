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

(define (segments->painter segment-list) ; return a procedure that draws segments in a given frame
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment)) ; x transform
        ((frame-coord-map frame) (end-segment segment)))) ; y transform
     segment-list)))

(define (make-segment x1 y1 x2 y2) 
  (cons (make-vect x1 y1) (make-vect x2 y2)))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

