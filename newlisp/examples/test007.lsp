;problem 24
(define (A n)
    (if (= n 1) 1 (* n (A (- n 1))))
)
(set 'v 0 'r 999999 'l '())
(for (i 9 1 -1)
    (setq v (A i))
    ;(println (/ r v))
    (push (/ r v) l -1)
    (setq r (mod r v))
)
(push 0 l -1)
(println l)
(set 'a '(0 1 2 3 4 5 6 7 8 9))
(set 'result '())
(map 
    (lambda (i) 
        (let (idx (nth i a))
            (push idx result -1)
            (pop a i)
        )
    ) 

l)
(println result)

(define (perm n idx)
    (if (= idx (- (length n) 1))
        (println n)

        (for (i idx (- (length n) 1))
            (swap (nth i n) (nth idx n))                
            (perm n (+ idx 1))
            (swap (nth i n) (nth idx n))                
        )
    )
)

(perm (explode "012") 0)





(exit)
