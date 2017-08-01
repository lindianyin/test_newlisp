;Problem 5


(define (problem-5)
    (let (n 20 r 0 seq (sequence 1 20))
        (while true
            ;(println n)
            (setq r (apply +
                (map 
                 (lambda (x)
                     (if (= (mod n x) 0) 1 0 ) 
                 )
                 seq
                )
                )
            )
            (if (!= 20 r)
                (inc n 20) 
                (throw n)
            )
        )
    )
)


(println (catch (problem-5)))


(exit)




