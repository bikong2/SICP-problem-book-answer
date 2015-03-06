;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname sum-of-two) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (sum-of-two x y z)
   (cond ((and (< x y) (< x z)) (+ y z))
         ((and (< y x) (< y z)) (+ x z))
         (else (+ x y))
   )
)

(sum-of-two 7 5 3)
(sum-of-two 3 7 1)
(sum-of-two 1 2 3)