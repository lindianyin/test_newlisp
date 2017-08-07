;problem 34
(new Tree 'mycache)
(define (myfactor n)
    (if (mycache n)
        (mycache n)
    
        (if (or (= n 0 ) (= n 1))
            1L
            (begin 
                (setq r (* (bigint n) (myfactor (- n 1))))   
                (mycache n r)
            )
        )
    )    

) 

(for (i 1 1000000)
    (setq a (apply + (map myfactor (map int (explode (string i) )))))
    (if (= i a)
        (println i)
    )
)


(exit)
