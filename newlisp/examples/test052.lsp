(define (strsort n)
    (join (sort (explode (string n))))
)


(set 'n 1)
(catch 
    (while true
        (setq r (= 1 (length (unique (map strsort (map (lambda (x) (* n x)) (sequence 1 6)))))))
        (when r
            (println n)  
            (throw n)
        )
        (inc n)
    )
)


(exit)
