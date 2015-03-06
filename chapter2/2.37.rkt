#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map! p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (firsts seqs))
            (accumulate-n op init (rests seqs)))))

(define (firsts seqs)
  (accumulate cons '() (map! (lambda (x) (car x)) seqs)))

(define (rests seqs)
  (accumulate cons '() (map! (lambda (x) (cdr x)) seqs)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map! (lambda (x) (dot-product v x))  m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map! (lambda (x) (matrix-*-vector cols x)) m)))

;;test
(map + (list 1 2 3) (list 4 5 6) (list 7 8 9))
(dot-product '(1 2 3) '(1 2 3))
(matrix-*-vector '((1 2 3) (4 5 6) (7 8 9)) '(1 2 3))
(transpose '((1 2 3) (4 5 6)))
(matrix-*-matrix '((1 2) (3 4)) '((1 2) (3 4)))