;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; b means base
; recursive
(define (expt-1 b n)
  (if (= n 0)
      1
      (* b (expt-1 b (- n 1)))))
; iterative
(define (expt-2 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))
; fast-iter recursive
(define (fast-expt-1 b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-1 b (/ n 2))))
        (else (* b (fast-expt-1 b (- n 1))))))

(define (square x) (* x x))

; fast-iter iterative
(define (fast-expt-2 b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
  (cond ((= counter 0) product)
        ((even? counter) (fast-expt-iter (* b b) (/ counter 2) product))
        (else (fast-expt-iter b (- counter 1) (* product b)))))

; test
(fast-expt-2 2 9)
(fast-expt-2 2 10)
(fast-expt-2 2 11)