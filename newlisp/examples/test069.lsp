
(define (fai n)
    (list n
    (div n (mul n (apply mul (map (lambda (x) (sub 1 (div 1 x))) (unique (factor n))))))
    )
)

(setq lst (map fai (sequence 2 1000000)))
(setq lst1
    (sort lst (lambda (a b) (< (a 1) (b 1))))
)
(println (last lst1))


(exit)

