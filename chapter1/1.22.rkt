(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
; time related
(define (time-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time) n)
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
(search-three-primes  10000000000)
(search-three-primes  100000000000)