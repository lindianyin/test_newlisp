
(define (pandigital? n)
    (= (sort (map int (explode (string n)))) (sequence 1 9))
)

(set 'result '())

(dolist (x (sequence 5000 10000))
    (setq s (join (map (lambda (i) (string (* i x)) ) (sequence 1 2)))) 
    (if (pandigital? s)
        (push (int s) result -1)
    )
)
(dolist (x (sequence 100 333))
    (setq s (join (map (lambda (i) (string (* i x)) ) (sequence 1 3)))) 
    (if (pandigital? s)
        (push (int s) result -1)
    )
)
(dolist (x (sequence 25 33))
    (setq s (join (map (lambda (i) (string (* i x)) ) (sequence 1 4)))) 
    (if (pandigital? s)
        (push (int s) result -1)
    )
)
(dolist (x (sequence 9 9))
    (setq s (join (map (lambda (i) (string (* i x)) ) (sequence 1 5)))) 
    (if (pandigital? s)
        (push (int s) result -1)
    )
)

(println result)
(println (sort result))

(println (pandigital? 978654311))


(exit)

