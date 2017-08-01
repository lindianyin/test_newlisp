;problem 14

(new Tree 'cache) 

(define (collztz n)
    (let (r)
       (while (> n 1)
            (if (even? n)
                (begin
                    (push n r -1)
                    (setq n (/ n 2))
                )
                (begin
                    (push n r -1)
                        (setq n (+ 1 (* n 3)))
                )
            )
       )
       (push 1 r -1)
   )
)
(set 'm 0)
(set 'l 0)
(for (i 1 1000000) 
    (let (r (collztz i))
        (if (> (length r) l)
            (begin 
                (setq l (length r))    
                (setq m i)
            )
        )
    )
)

(println m "\t" l)

(exit)
