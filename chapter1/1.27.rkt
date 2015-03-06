(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; test Carmichael number 
(define (carm-test n)
  (define (test-iter a n true-count false-count)
    (if (> a 0) 
        (if (= (expmod a n n) a)
            (test-iter (- a 1) n (+ true-count 1) false-count)
            (test-iter (- a 1) n true-count (+ false-count 1)))
        (begin
          (display "equal : ")
          (display true-count)
          (newline)
          (display "not eq: ")
          (display false-count))
        ))
  (define a (- n 1))
  (test-iter a n 0 0))

; test
(carm-test 10000)