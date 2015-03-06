#lang racket

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

;(define (scale-tree tree factor)
;  (cond ((null? tree) '())
;        ((not (pair? tree)) (* tree factor))
;        (else (cons (scale-tree (car tree) factor)
;                    (scale-tree (cdr tree) factor)))))

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))

(define (square x) (* x x))

;(define (square-tree tree)
;  (map (lambda (sub-tree)
;         (if (pair? sub-tree)
;             (square-tree sub-tree)
;             (square sub-tree)))
;       tree))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

;;test
(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
