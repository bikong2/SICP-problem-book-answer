(define (factorial-1 n)
  (if (= n 0)
      1
      (* n (factorial-1 (- n 1)))))

(define (factorial-2 n)
  (define (fact-iter product counter max-counter)
    (if (> counter max-counter)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-counter)))
  (fact-iter 1 1 n))

;test
(factorial-1 80)