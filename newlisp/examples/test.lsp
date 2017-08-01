;Pro
(define (prime? n)
    (= (length (factor n)) 1)
)

(println (prime? 10))
(println (prime? 13))

(define (A n)
    (+ (add (pow n) n) 41)
)

;(for (i 0 39)
;    (println i "\t" (prime? (A i)))
;)

(define (B n a b)
    (+ (+ (pow n) (* a n)) b)
)
(set 'mm nil)
(set 'maxn 0)
(set 'min_ 1)
(set 'max_ 20)
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

(exit)
