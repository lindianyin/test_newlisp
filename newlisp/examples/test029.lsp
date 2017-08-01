;problem 29

(set 'lst '())
(define (mypow a b)
    (if (= 1 b) 
        (bigint a)
        (* (bigint a) (mypow a (- b 1)))
    )
)
(println (mypow 2 1000))

(for (a 2 100)
    (for (b 2 100)
        (push (mypow a b) lst -1)       
    )
)

(println (length lst))
(println (length (unique lst)))


(exit)


