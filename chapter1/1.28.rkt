(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x) (* x x))

(define (mr-test n)
  (define (try-it a)
    (if (and (and (> a 1) (< a (- n 1))) (= (remainder (square a) n) 1))
        #f
        (= (expmod a n n) a)))
  (try-it (+ 1 (random (- n 1))))) ; test with [1, n-1] randomly

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (fast-prime? n (- times 1)))
        (else false)))

; test
(fast-prime? 6601 3500)