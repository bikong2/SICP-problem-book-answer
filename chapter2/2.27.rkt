#lang racket

(define (my-reverse items)
  (define (my-reverse-rec ls0 ls1)
    (if (null? ls0)
        ls1
        (my-reverse-rec (cdr ls0) (cons (car ls0) ls1))))
  (my-reverse-rec items '()))

(define (deep-reverse items)
  (define (deep-reverse-rec ls0 ls1)
    (if (null? ls0)
        ls1
        (if (not (pair? (car ls0)))
            (deep-reverse-rec (cdr ls0) (cons (car ls0) ls1))
            (deep-reverse-rec (cdr ls0) (cons (deep-reverse-rec (car ls0) '()) ls1)))))
  (deep-reverse-rec items '()))
          

;;test
(define x (list (list 1 2) (list 3 4)))

x

(my-reverse x)

(deep-reverse x)
