#lang scheme

(define (equal? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((or (and (null? items1) (not (null? items2)))
             (and (null? items2) (not (null? items1))))
         false)
        ((not (eq? (car items1) (car items2))) false)
        (else (equal? (cdr items1) (cdr items2)))))

;;test
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '() '())
(equal? '(a b c) '(a b))