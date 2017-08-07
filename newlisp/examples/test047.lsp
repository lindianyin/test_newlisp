
(setq i 2)
(setq r
(catch 
(while true 
    (setq a (length (unique (factor i))))
    (setq b (length (unique (factor (+ i 1)))))
    (setq c (length (unique (factor (+ i 2)))))
    (setq d (length (unique (factor (+ i 3)))))
     
    (if
        (and
            (= 4 a b c d) 
        )
        (throw (list i))

    )
    (inc i)
)
)
)

(println r)

(exit)

