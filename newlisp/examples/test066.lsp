
(define (sqrt? n)
    (= n (pow (int (sqrt n))))
)

(println (sqrt? 10))
(println (sqrt? 16))
(set 'result '())
(for (D 62 64)
    (when (not (sqrt? D))
    (let (y 1)
        (catch 
        (while true
            (setq r (+ 1 (* D (pow y))))
            (when (sqrt? r)
                (push (list (sqrt r) D y) result -1)
                (throw)
            )
            (inc y)
        )
        )
    )
    )
) 


(println result)




(exit)
