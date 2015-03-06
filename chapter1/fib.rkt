(define (fib-1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-1 (- n 1))
                 (fib-2 (- n 2))))))

(define (fib-2 n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

; test
(fib-1 10)
(fib-2 10)