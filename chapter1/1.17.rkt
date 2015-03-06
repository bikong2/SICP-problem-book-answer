(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x) (+ x x))

(define (halve x) (/ x 2))
; recurse
(define (fast-*-1 a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-*-1 a (halve b))))
        (else (+ a (fast-*-1 a (- b 1))))))
; iterative
(define (fast-*-2 a b)
  (fast-iter a b 0))

(define (fast-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (fast-iter (double a) (halve b) product))
        (else (fast-iter a (- b 1) (+ product a)))))

; test
(fast-*-2 0 0)
(fast-*-2 0 1)
(fast-*-2 1 0)
(fast-*-2 10 10)