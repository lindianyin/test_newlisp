

(set 'n 2)
(new Tree 'ch)

(catch 
(while true
    (setq s (join (sort (explode (string (pow n 3))))))
    (ch n s)
    (setq c 0)
    (setq lst (list n ))
    (for (i (- n 1) 1)  
        (setq _s nil)
        (if (ch i)
            (setq _s (ch i))
            (setq _s (join (sort (explode (string (pow i 3))))))  
        )
        (when (= s _s)
            (push i lst -1)
            (inc c)
            ;(println lst)
        )
    )
    (when (>= c 4)
        (println lst)
        ;(throw n) 
    )
    (inc n)
)
)
(exit)
