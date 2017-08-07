;problem 33

(set 'result '())
(define (dcf a b)
    (let (lst (unique (explode (append (string a) (string b)))))
       (for (i 0 (- (length lst) 1))
            (setq _a (string a) _b (string b))
            (if (=
                    (div
                        (int (replace (lst i) _a "" 0x8000))  
                        (int (replace (lst i) _b "" 0x8000))  
                    )
                    (div a b)
                )
                (push (list a b) result -1)
            )
       ) 
    )
)


(for (i 10 98)
    (for (j (+ i 1) 99)
        (and 
            (!= 0 (% i 10))     
            (!= 0 (% j 10))     
            (dcf i j)        
        )
    )
)

(println result)
(set 'a 1 'b 1)
(for (i 0 (- (length result) 1))
   (setq a (* a (result i 0)))
   (setq b (* b (result i 1)))
)

(println a " " b)
(set 'g (gcd a b))

(println (/ b g))





(exit)
