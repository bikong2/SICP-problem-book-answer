#lang racket

(define us-coins (list 50 25 10 5 1))
(define cn-coins (list 50 20 10 5 2 1))

(define (no-more? items)
  (if (null? items)
      #t
      #f))

(define (first-denomination items)
  (car items))

(define (except-first-denomination items)
  (cdr items))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;;
(cc 100 us-coins)
(cc 100 cn-coins)