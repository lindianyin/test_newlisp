(define (allnum? n)
    (= (sequence 0 9) (map int (sort (explode (string n)))) )
)

(set 'primes '(2 3 5 7 11 13 17))

(for (i 1 9876543210)
    (if (allnum? i)
        (println i)
    )
)











(exit)
