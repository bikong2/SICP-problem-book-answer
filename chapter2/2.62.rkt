#lang scheme

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (let ((first-elem (car set)))
    (cond ((= x first-elem) set)
          ((< x first-elem) (cons x set))
          ((< first-elem x) (cons (car set) (adjoin-set x (cdr set)))))))

(define (union-set set1 set2)
  (if (null? set1) 
      set2
      (if (null? set2) 
          set1
          (let ((x1 (car set1)) (x2 (car set2)))
            (cond ((= x1 x2)
                   (cons x1
                         (union-set (cdr set1)
                                    (cdr set2))))
                  ((< x1 x2)
                   (cons x1
                         (union-set (cdr set1)
                                    set2)))
                  ((< x2 x1)
                   (cons x2
                         (union-set (cdr set2)
                                    set1))))))))

;;test
(intersection-set '(1 2 3 4 5) '(3 4 5 6 7))
(adjoin-set 5 '(2 3 4 6))
(element-of-set? 2 '(1 3 4 5))
(union-set '(3 6 9) '(1 4 6 7 9))
(union-set '() '(1 2 3))