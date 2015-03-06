#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (firsts seqs))
            (accumulate-n op init (rests seqs)))))

(define (firsts seqs)
  (accumulate cons '() (map (lambda (x) (car x)) seqs)))

(define (rests seqs)
  (accumulate cons '() (map (lambda (x) (cdr x)) seqs)))

;;test
(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
;(traits '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
;(rests '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))