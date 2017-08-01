;Problem 27
(define (prime? n)
    (= (length (factor n)) 1)
)

(define (B n a b)
    (+ (+ (pow n) (* a n)) b)
)

(set 'mm nil)
(set 'maxn 0)
(set 'min_ -1000)
(set 'max_ 1000)
(for (a min_ max_)
    (for (b min_ max_)
        (let (n 0)
            (catch 
                (while true
                    (setq v (B n a b))
                    (if (not (prime? v))
                        (throw _r) 
                        (inc n)
                    )
                    (setq m (list n a b v))
                    (if (< maxn n)
                        (begin
                            (setq maxn n)
                            (setq mm m) 
                        )
                    )
                ) 
            )
        )        
    )
)

(println mm)
(println (* (nth 1 mm) (nth 2 mm)) )
(exit)
