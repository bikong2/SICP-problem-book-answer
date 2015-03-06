(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

; fermat prime test
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

; time related
(define (time-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (current-process-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (current-process-milliseconds) start-time) n)
      #f))

(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

; search for primes
(define (search-for-primes n max)
  (cond ((< n max) (time-prime-test n)(search-for-primes (+ n 2) max))))

; search three primes bigger than n
(define (search-three-primes n)
  (define (search-iter n counter)
    (if (< counter 3)
        (if (time-prime-test n) 
             (search-iter (+ n 2) (+ counter 1))
             (search-iter (+ n 2) counter))
        ))
         
  (if (even? n)
      (search-iter (+ n 1) 0)
      (search-iter n 0)))

; test
(search-three-primes  1000)
(search-three-primes  10000)
(search-three-primes  100000)
(search-three-primes  1000000)
(search-three-primes  10000000)
(search-three-primes  100000000)
(search-three-primes  1000000000)