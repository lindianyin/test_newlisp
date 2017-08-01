;problem 25 

(new Tree 'cah)
(define (fib n)
    (let (t (cah n))
        (if (not t) 
            (if (or (= n 0) (= n 1)) 
                (begin
                    (cah n 1L) 
                    1L
                )
                (let (v (+ (fib (- n 1)) (fib (- n 2))))
                    (cah n v)
                    v
                )
            )
            t
        )
    )
)

(set 'idx 0)
(println (catch (while true
    (let (v (fib idx)) 
        (if (= 1001 (length (string v)))
            (throw (list idx v))
        )
        (inc idx)
    )
)))




(exit)
