;problem 16

(define (mypow m n)
   (if (= n 1)
        m
        (* (bigint m) (mypow m (- n 1)))
   ) 
)

(println (apply + (map int (explode (replace "L" (string (mypow 2 1000)) "" )))))



(exit)
