(set 'maxp 0)
(set 'maxn 0)
(for (n 1 1000) 
    (setq cnt 0)
    (for (i 1 n)
        (for (j i n)
            (setq _c (- (- n i) j))
            (if (and 
                    (> (+ i j) _c)
                    (< (abs (- i j)) _c )
                    (< i _c)
                    (< j _c)
                )
                (begin 
                    (setq c (+ (pow i) (pow j)))
                    (setq pc (pow (- (- n i) j)))
                    (if (= c pc)
                        (begin
                            (println n " "  i " " j " " (sqrt c))
                            (inc cnt)
                        )
                    )
                )

            )
        )
    )

    (if (> cnt maxn)
        (begin
            (setq maxp n)
            (setq maxn cnt)
        )
    )
)

(println maxp)
(println maxn)



(exit)
