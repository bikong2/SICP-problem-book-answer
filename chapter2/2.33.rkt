#lang racket

;(define (map proc items)
;  (if (null? items)
;      '()
;      (cons (proc (car items))
;            (map proc (cdr items)))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (length! sequence)
  (if (null? sequence)
      0
      (+ 1 (length! (cdr sequence)))))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define (append! seq1 seq2)
  (if (null? seq1)
      seq2
      (cons (car seq1)
            (append (cdr seq1) seq2))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))


;;test
(map abs (list -1 2 -3 4))
(length (list 1 2 3 4 5))
(length! (list 1 2 3 4 5))
(append (list 1 2 3 4) (list 1 2 3))
(append! (list 1 2 3 4) (list 1 2 3))