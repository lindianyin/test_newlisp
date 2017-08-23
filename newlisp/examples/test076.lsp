
(setq amount 100)
(setq coins (sequence 0 (- amount 1)))
(setq ways (array (+ amount 1)))
(setq (ways 0) 1)
(trace true)
(for (i 1 (- amount 1))
    (for (j (coins i) amount)
        (inc (ways j) (ways (- j (coins i))))
    )
)
(trace nil)
(println (ways amount))




(exit)


