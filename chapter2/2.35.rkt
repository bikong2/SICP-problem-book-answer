#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (count-leaves! x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves! (car x))
                 (count-leaves! (cdr x))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (not (pair? x)) 1 x)) t)))

;;test
(count-leaves! (list 1 2))
(count-leaves (list 1 2))
