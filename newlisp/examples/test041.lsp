
(define (allnum? n)
    (= (sequence 1 (length (string n))) (map int (sort (explode (string n)))) )
)

(catch 
(for (i 7654321 2)
   (and 
        (= 1 (length (factor i))) 
        (allnum? i) 
        (println i)
        (throw i)
    )
)
)


(exit)
