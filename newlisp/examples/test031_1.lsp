;problem 31

(set 'coins '(1 2 5 10 20 50 100 200))
(set 'amount 1000)

(define (ways target avc)
    (if (<= avc 0) 1 
        (let (res 0)
            (while (>= target 0) 
                (inc res (ways target (- avc 1)))
                (dec target (nth avc coins))
            )
            res
        ) 
    )
)

(println (ways amount 7))





(exit)

