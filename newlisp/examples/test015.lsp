;problem 15

(define (factorial n)
    (if (= 1 n) 
        1
        (* (bigint n) (factorial (- n 1)))
    ) 
)
(define (C n m)
    (/ (factorial n)  (* (factorial (- n m)) (factorial m)) )
)

(println (C 40 20))
(exit)
