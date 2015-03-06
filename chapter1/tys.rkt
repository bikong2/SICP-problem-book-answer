#lang racket
(require compatibility/defmacro)
(define is-even?
  (lambda (n) 
    (if (= n 0) 
        #t
        (is-odd? (- n 1)))))

(define is-odd?
  (lambda (n)
    (if (= n 0)
        #f
        (is-even? (- n 1)))))

(letrec ((local-even? (lambda (n) 
                        (if (= n 0)
                            #t
                            (local-odd? (- n 1)))))
         (local-odd? (lambda (n)
                       (if (= n 0)
                           #f
                           (local-even? (- n 1))))))
  (list (local-even? 23) (local-odd? 23)))

(letrec ((countdown (lambda (i)
                      (if (= i 0)
                          'liftoff
                          (begin
                            (display i)
                            (newline)
                            (countdown (- i 1)))))))
  (countdown 10))

(let countdown((i 10))
  (if (= i 0)
      'liftoff
      (begin
        (display i)
        (newline)
        (countdown (- i 1)))))

(define find-position
  (lambda (key ls)
    (let loop ((i 0) (ls ls))
      (if (null? ls)
          #f
          (if (eqv? (car ls) key)
              i
              (loop (+ i 1) (cdr ls)))))))

(find-position 5 '(1 2 3 4))

(define reverse!
  (lambda (s)
    (let loop ((s s) (r '()))
      (if (null? s)
          r
          (loop (cdr s) (cons (car s) r))))))

(reverse! '(1 2 3 4))

(define add2
  (lambda (x)
    (+ x 2)))
(map add2 '(1 2 3))

(for-each display
          (list "one " "two " "three"))
(newline)

(map cons '(1 2 3) '(10 20 30))
(map * '(1 2 3) '(10 20 30))

(define i (open-input-file "hello.txt"))
(read-char i)
(define j (read i))
j


(call-with-input-file "hello.txt"
  (lambda (i)
    (let* ((a (read-char i))
           (b (read-char i))
           (c (read-char i)))
      (list a b c))))

(let ((i (open-input-string "hello world")))
  (begin
    (read-char i)))

(let ((o (open-output-string)))
  (write 'hello o)
  (get-output-string o))

(define-macro my-or
  (lambda (x y)
    (let ((temp (gensym)))
      `(let ((,temp ,x))
         (if ,temp ,temp ,y)))))
  
(my-or 1 2)
(my-or #f 2)
(my-or #f #f)
(define temp 3)
(my-or #f temp)

(define-macro when
  (lambda (test . branch)
    (list 'if test
          (cons 'begin branch))))

(when (< 1 2)
  (display "1 ")
  (display "2")
  (newline))