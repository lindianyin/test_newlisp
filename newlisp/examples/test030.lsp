;problem 30



(define (A n)
    (= n (apply add (map (lambda (x) (pow x 5)) (map int (explode (string n))))))
)
(set 'lst '())
(for (i 2 355000)
    (if (A i)
        (push i lst -1)
    )
)

(println (apply + lst))


(exit)

