(define vhello "Hello world")

(define fhello (lambda()
                 "Hello world"))

(define hello (lambda (name)
                (string-append "Hello " name "!")))

(define sum3 (lambda (a b c)
               (+ a b c)))

(define inc (lambda (a)
              (+ a 1)))

(define dec (lambda (a)
              (- a 1)))

(define abs (lambda (a)
              (if (< a 0)
                  (- a)
                  a)))

(define inverse (lambda (a)
                  (if (= a 0)
                      #f
                      (/ 1 a))))

(define int2char (lambda (i)
                   (if (> i 32)
                       (if (< i 127)
                           (integer->char i)
                           #f)
                       #f)))

(define multiply3-v1 (lambda (a b c)
                    (if (and (> a 0) (> b 0) (> c 0))
                        (* a b c)
                        #f)))

(define multiply3-v2 (lambda (a b c)
                       (if (or (< a 0) (< b 0) (< c 0))
                           (* a b c)
                           #f)))
; test
;(let ((i 1))
;  (let ((j (+ i 2)))
;    (* i j)))
;(let* ((i 1) (j (+ i 2))) (* i j))

(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls))
            (list*2 (cdr ls)))))

(define (list-length ls)
  (if (null? ls)
      0
      (+ 1 (list-length (cdr ls)))))

(define (list-sum ls)
  (if (null? ls)
      0
      (+ (car ls) (list-sum (cdr ls)))))

(define (remove x ls)
  (if (null? ls)
      '()
      (let ((h (car ls)))
        ((if (eqv? x h)
             (lambda (y) y)
             (lambda (y) (cons h y)))
         (remove x (cdr ls))))))
      
(define (find x index ls)
  (if (null? ls)
      #f
      (if (= x (car ls))
          index
          (find x (+ index 1) (cdr ls)))))

(define (my-reverse ls rev)
  (if (null? ls)
      rev
      (my-reverse (cdr ls) (cons (car ls) rev))))

(define (list-sum-tail ls sum)
  (if (null? ls)
      sum
      (list-sum-tail (cdr ls) (+ sum (car ls)))))

(define (string2int str)
  (define (ls2int ls num)
    (if (null? ls)
        num
        (ls2int (cdr ls) (+ (* num 10) (- (char->integer (car ls)) 48)))))
  (ls2int (string->list str) 0))

; range function, to generate [0, n)
(define (range n)
  (let loop((i 0) (ls '()))
    (if (= i n)
        (reverse ls)
        (loop (+ i 1) (cons i ls)))))

(remove 4 '(1 2 3 4 5 4 3 4 2 2 2 4))