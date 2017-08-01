;problem 31

(set 'target 200)
(set 'coinSizes '(1 2 5 10 20 50 100 200))
(set 'ways (array (+ target 1)))
(setq (ways 0) 1) 

(for (i 0 (- (length coinSizes) 1) )
    (for (j (nth i coinSizes) target)
       (println ways)
       (inc (nth j ways) (nth (- j (coinSizes i)) ways ))
    )
)

(println ways)

(exit)
