
(define (palindromic? n)
    (= (string n) (reverse (string n)))
)

(println (palindromic? 121))

(define (reversenum n)
    (int (trim (reverse (string n)) "0"))
)

(setq 'cnt 0)
(define (lychrel)
    (for (i 1 9999)
        (setq s i)
        (setq b nil)
        (catch
        (for (j 1 50) 
            (setq s  (+ s (reversenum s))) 
            (when (palindromic? s)
                (println (list i s))
                (setq b true)
                (throw i) 
            ) 
        )
        )
        (if (not b) 
            (inc cnt)
        )
    )
) 

(println (reversenum 10))
(lychrel)
(println cnt)

(exit)
