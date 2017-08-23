(load "./rational.lsp")

(setq lst '())
(setq a 3)
(setq b 2)
(setq limit 12000)
(setq result 0)
(for (d 5 limit)
    (for (n (+ (/ d a ) 1) (/ (- d 1) b) )
        (when (= 1 (gcd n d))
            (inc result)
        )
    ) 
)

(println result)

(exit)
