; speed up a recursive function using memoization
(define-macro (memoize mem-func func)
    (set (sym mem-func mem-func)
        (letex (f func  c mem-func)
          (lambda ()
              (or (context c (string (args)))
              (context c (string (args)) (apply f (args))))))))
       
(define (fibo n)
    (if (< n 2)  1
        (+  (fibo (- n 1))
            (fibo (- n 2)))))
       
(memoize fibo-m fibo)

(define (factorial n)
    (if (or (= n 1) (= n 0))
        (bigint 1)
        (begin
            (* (bigint n) (factorial (- n 1)))    
        ) 
    )
)


(memoize factorial-m factorial)
       
(println (time (fibo-m 25)))
(println (time (fibo-m 25)))
(println (time (fibo-m 25)))
(println (time (factorial-m 25)))
(println (time (factorial-m 25)))
(println (factorial-m 25))

(define (combinatoric n r)
    (/ (factorial-m n) (* (factorial-m r) (factorial-m (- n r)) ))
)
(println (factorial-m 21))
;(println (combinatoric 21 0))

(set 'cnt 0)
(for (n 1 100)
    (for (r 0 n)
       (setq c (combinatoric n r)) 
       (when (> c 1000000)
            (println (list c n r))
            (inc cnt)
       ) 
    )
)

(println (list 'cnt cnt))





(exit)
