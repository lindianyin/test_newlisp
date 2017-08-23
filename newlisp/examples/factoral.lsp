(new Tree 'ch)
(define (factoral n)
    (setq r (ch n))
    (if r
        r
        (if (or (= n 0 ) (= n 1))
            1
            (begin
                (setq r
                (* n (factoral (- n 1)))
                )
                (ch n r)
                r
            )
        ) 
    ) 
)





