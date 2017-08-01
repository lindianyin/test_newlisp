(define (pandigital? n)
    (let (s (map int (sort (explode (string n)))))
        (= s (sequence (s 0) (s -1)))
)

(define (repeat? n)
    (let (r (explode (string n)))
        (!= (length r) (length (unique r)))
    )
)

(define (ctzero? n)
    (!= nil (find "0" (explode (string n))))
)

(println (ctzero? 10))


(for (i 1 987654321) 
    (for (j 1 978654321)
        (and
            (not (repeat? i))
            (not (repeat? j))
            (not (ctzero? i))
            (not (ctzero? j))
            (not (ctzero? (* i j)))
            (let (r (* i j))
                (if (pandigital? (int (append (string i) (string j) (string r))))
                   (println i "*" j "=" r )
                ) 
            )
        )
    )
)



;(println (pandigital? 1324))


(exit)

