;problem 26
;Reciprocal cycles

(let (maxn 0 maxlen 0 )
    (for (n 2 1000)
        (let (rt 1 r 0 len 0)
            (for (i 0 (- n 1))
                (setq rt (% (* rt 10) n)) 
            )
            (setq r rt)
            (do-while (!= rt r)
                (setq rt (% (* rt 10) n)) 
                (inc len) 
            ) 
            (if (> len maxlen)
                (begin
                    (setq maxn  n)
                    (setq maxlen len) 
                )
            ) 
        )
    )
    (println maxn "\t" maxlen)
)

(exit)
