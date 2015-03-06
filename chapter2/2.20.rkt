#lang racket

(define (same-parity a . ls) 
  (define (map-list filter ls0 ls1)
    (if (null? ls0)
        ls1
        (if (filter (car ls0))
            (map-list filter (cdr ls0) (cons (car ls0) ls1))
            (map-list filter (cdr ls0) ls1))))
  
  (if (even? a)
      (reverse (map-list even? ls (cons a '())))
      (reverse (map-list odd? ls (cons a '())))))

;;test
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)