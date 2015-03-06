;(define (f n)
;  (if (< n 3)
;      n
;      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (f n)
  (define (f-iter a b c counter)
    (if (< counter 3)
        c
        (f-iter b c (+ c (* 2 b) (* 3 a)) (- counter 1))))
  (if (< n 3)
      n
      (f-iter 0 1 2 n)))

; test
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)