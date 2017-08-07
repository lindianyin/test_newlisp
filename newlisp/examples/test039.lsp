(set 't 1000)
(for (m 2 (int (sqrt (/ t 2))))
   (for (n 1 m)
        (if (and  
                (= 1 (gcd m n))
                (> m n)
            )
            (begin
                (setq a (* 2 (* m n)))
                (setq b (- (pow m) (pow n) ))
                (setq c (+ (pow m) (pow n) ))
                (setq p (* m (+ m n )))
                (if (> a b)
                    (for (k 1 (/ t p))
                        (println (list (* k a) (* k b) (* k c) (* k p)))
                    )
                )
            )

        )
   ) 
)



(exit)
