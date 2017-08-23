
(define (fraction S)
    (letn (m 0  d 1 a (int (sqrt S)) a0 a lst '()) 
        (catch
        (while true
           (setq m (- (* d a) m)) 
           (setq d (/ (- S (pow m)) d))
           (setq a (/ (+ a0 m) d))
           (push a lst -1)
           (if (= (* 2 a0) a)
                (throw)
            )
        )
       ) 
       lst
    )
)



(set 'cnt 0)
(for (i 2 10000)
    (when (!= i (pow (int (sqrt i)))) 
       (setq lst (fraction i)) 
       (if (odd? (length lst))
           (inc cnt) 
       ) 
    )
)


(println cnt)

(println (fraction 21))




(exit)


