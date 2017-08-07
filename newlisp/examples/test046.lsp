(set 'nbs
(filter 
    (fn (x)   
        (and
            (odd? x)
            (!= 1 (length (factor x)))
        )

    ) 
    (sequence 2 50000)))

;(println nbs)


(set 'prims
(filter 
    (fn (x)   
        (and
            (= 1 (length (factor x)))
        )

    ) 
    (sequence 2 50000)))

;(println prims)


(dolist (x nbs)
   (setq ct nil)
   (dolist (y prims (or (< x y) ct)  )
        (setq a (/ (- x y) 2))
        (setq b (pow (int (sqrt a))))
        (if (= a b)
            (begin
                (setq ct true) 
                ;(println (list a b x y))
            )
        )
   ) 
   (if (not ct)
        (println x)
   )
)




(exit)

