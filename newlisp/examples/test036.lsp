(define (ten? n)
    (= n (int (trim (reverse (string n)) "0" "")))
)

(define (two? n)
    (= n (int (trim (reverse (bits n)) "0" "") 0 2))
)

(set 'r '())
(for (i 1 1000000)
    (and
        (ten? i)
        (two? i)
        (push i r -1)
    )    
)
(println r)
(println (apply + r))

(exit)
