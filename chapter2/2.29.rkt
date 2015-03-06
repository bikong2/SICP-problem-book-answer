#lang racket

;;a
(define (left-branch mobile) (list-ref mobile 0))
(define (right-branch mobile) (list-ref mobile 1))
(define (branch-length branch) (list-ref branch 0))
(define (branch-structure branch) (list-ref branch 1))
;;b
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (list-ref mobile 0))
                 (total-weight (list-ref mobile 1))))))
;;c
(define (balance? mobile)
  (define (balance-rec? mobile depth)
    (cond ((null? mobile) 0)
          ((not (pair? mobile)) (* mobile depth))
          (else 
           (let ((left (balance-rec? (list-ref mobile 0) (+ 1 depth)))
                 (right (balance-rec? (list-ref mobile 1) (+ 1 depth))))
             (if (eqv? left right)
                 (+ left right)
                 #f)))))
  (balance-rec? mobile 0))