
(set 'nbs (map int (parse (trim (read-file "./p059_cipher.txt")) ",")))

;(println nbs)

(define (digit? n)
    (and 
        (>= n (char "0"))
        (<= n (char "9"))
    )
)

(define (alph? n)
    (or
        (and 
            (>= n (char "A"))
            (<= n (char "Z"))
        )
        (and 
            (>= n (char "a"))
            (<= n (char "z"))
        )
    )
)

(define (other? n)
    (and 
        (!= n (char "#"))
        (!= n (char "~"))
        (!= n (char "&"))
        (!= n (char ">"))
        (!= n (char "<"))
        (!= n (char "\\"))
        (!= n (char "?"))
        (!= n (char "*"))
        (!= n (char "%"))
        (!= n (char "{"))
        (!= n (char "}"))
    )
)




(for (i (char "a") (char "z"))
    (for (j (char "a") (char "z"))
        (for (k (char "a") (char "z"))
            (setq keys (list i j k))
            (setq idx 0)
            (setq r '())
            (setq invalid false)
            (catch 
            (for (n 0 (- (length nbs) 1))
                 (setq ch
                    (^ (keys idx) (nbs n)) 
                 )

                 (if 
                    (or
                        (digit? ch)
                        (alph? ch)
                        (other? ch)
                    )
                    (begin 
                        (push (char ch) r -1)
                    )
                
                    (begin
                        (setq invalid true)
                        (throw)
                    )
                 )


                (inc idx)
                (setq idx (% idx 3))
            ) 
            )
            (if (not invalid)
                (begin
                    (println (join r))
                    (println (apply + (map char r)))
                )
            )
            
        ) 
    ) 
) 


;(println (join (map char nbs)))




(exit)
