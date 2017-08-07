(set 'R '())
(define (perm n idx)
    (if (= idx (- (length n) 1)) 
        (begin
            (push n R -1) 
        )
        (for (i idx (- (length n) 1)) 
            (swap (nth i n) (nth idx n))    
            (perm n (+ idx 1) r) 
            (swap (nth i n) (nth idx n))    
        )   
    )   
)
(new Tree 'mycache)
(define (myfactor n)
   (if (mycache n) 
        (mycache n)
        (begin
            (setq m (factor n))
            (mycache n m) 
            m
        )
    )
)



(set 'c 0)
(for (i 2 10000)
    (set 'R '())    
    (if (and  
        (= 1 (length (myfactor i)))
        (= 1 (length (myfactor (int (trim (reverse (string i)) "0" "" )))))     
        )
        (begin
            (perm (explode (string i)) 0) 
            ;(println R)
            (setq isp (apply and (map (lambda (x) (= 1 (length (myfactor x )) ) ) (map int (map (lambda (x) (trim (join x) "0" "" ) ) R)))))
            (if isp
                (begin
                
                (inc c)
                )
            )
            ;(println (int (join R "")))
        )
    )
)
(println c)

(exit)
