(set 'stable 
[text]
1   9   9   1   9   1   9   1
10  99  90  2   180 10  189 10
100 999 900 3   2700    190 2889    1000
1000    9999    9000    4   36000   2890    38889   10000
10000   99999   90000   5   450000  38890   488889  100000
100000  999999  900000  6   5400000 488890  5888889 1000000
[/text])


(set 'table (array 6 8 (map int (parse stable))))
(println table)

(define (getv n)
    (let (idx 0)
        (setq idx 
            (catch 
                (for (i 0 5) 
                   (setq s (table i 5) ) 
                   (setq e (table i 6) ) 
                    (if (and 
                            (<= s n)
                            (<= n e)
                        )
                       (throw i) 
                    )
                )
            )
        )
        (if (<= n 9)
            n
            (begin
                (setq row (table idx))
                (setq res ( - n (- (row 5) 1)))
                (setq m (% res (row 3)))
                (setq m1 (- res m))
                (setq n1 (/ m1 (row 3))) 
                (setq n2 (+ (row 0) n1)) 
                (setq r (join (map string (sequence n2 (+ n2 10))))) 
                (int (slice r (- m 1) 1))
            )
        )
        ;(println (list row res m m1 n1 n2 r)) 
        
        ;(println idx)
    )
)
(println (apply * (map getv (series 1 10 6))))
;(println (getv 1))
;(println (getv 10))
;(println (getv 100))
;(println (getv 1000))
;(println (getv 10000))











(exit)
