(load "./memoization.lsp") 


(define (corner n)
    (let (r '())
        (for (k 0 3)
            (setq v
                (- (pow (+ (* 2 n) 1))  (* k (+ (* 2 n) 1)) (- k))
            )
            (push v r -1)
        )
        r
    )
)

(memoize factor-m factor)


(println (corner 1))
(println (corner 2))

(set 'pc 0)
(set 'tc 1)


(for (i 1 100000)
   (setq lst 
    (corner i)
   )
   (setq c
   (length 
    (filter (lambda (x) (= (length (factor x)) 1)) lst)  
    )
   )
   (inc pc c)
   (inc tc 4) 
    (println pc " " tc )

   (if (< (div pc tc) 0.1)
        (begin
        (println (+ (* 2 i) 1))
        (throw i)  
        )
   )
)



(exit)
