#lang racket

(define (my-list-ref items n)
  (if (= n 0)
      (car items)
      (my-list-ref (cdr items) (- n 1))))

(define (my-length items)
  (if (null? items)
      0
      (+ 1 (my-length (cdr items)))))

(define (my-append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (my-append (cdr list1) list2))))

(define (my-last-pair items)
  (if (or (null? items) (null? (cdr items)))
      (car items)
      (my-last-pair (cdr items))))

(define (my-reverse items)
  (define (my-reverse-rec ls0 ls1)
    (if (null? ls0)
        ls1
        (my-reverse-rec (cdr ls0) (cons (car ls0) ls1))))
  (my-reverse-rec items '()))

;;test
(define ls (list 1 2 3 4))
(my-list-ref ls 0)
(my-length ls)
(my-append ls ls)
(my-last-pair ls)
(my-reverse ls)