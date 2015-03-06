#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse! items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (iter items '()))

(define (reverse!! items)
  (fold-left (lambda (x y) (cons y x)) '() items))

(define (reverse!!! items)
  (fold-right (lambda (x y) (append y (list x))) '() items))
;;test
(reverse! '(1 2 3 4 5))
(reverse!! '(1 2 3 4 5))
(reverse!!! '(1 2 3 4 5))