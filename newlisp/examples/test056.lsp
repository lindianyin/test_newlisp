(define (mypow a b)
    (if (= b 0)
        1
        (let (r 1L)
            (for (i 1 b)
               (setq r (* r a))
            )
            r
        )
    )
)

(set 'lst '())
(for (i 1 99)
    (for (j 1 99)
        (push
            (list 
                (apply + (map int (explode (replace "L" (string (mypow i j)) ""))))
                i
                j
            )
            lst
            -1)
    )

)
(println lst)
(println (last (sort lst (fn (a b) (< (a 0) (b 0)) ))))
(println (mypow 99 95))
(exit)
