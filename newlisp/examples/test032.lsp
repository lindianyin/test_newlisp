(define (pandigital? n)
    (let (s (map int (sort (explode (string n)))))
        ;(= s (sequence (s 0) (s -1))))
        (= s (sequence 1 9)))
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

(set 'result '())
(for (i 1 100) 
    (for (j i 10000)
        (and
            (not (repeat? i))
            (not (repeat? j))
            (not (ctzero? i))
            (not (ctzero? j))
            (not (ctzero? (* i j)))
            (let (r (* i j))
                (if (pandigital? (int (append (string i) (string j) (string r))))
                    (begin 
                        (println i "*" j "=" r )
                        (push r result -1)
                    )
                ) 
            )
        )
    )
)

(println (apply + (unique result)))

(exit)

