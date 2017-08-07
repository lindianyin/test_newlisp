
(set 'rf (read-file "./p042_words.txt"))

(define (cal s)
    (apply + (map (fn (x) (+ 1 (- (char x) (char "A"))) )  (explode s)))
)
;(println (cal "SKY"))

;(println rf)
(set 'words (map (fn (x) (trim x "\"" ) ) (parse rf ",")))



(set 'codedwords (map cal words))

(println  (length (filter 

(fn (x)
    (letn (d (+ 1 (* 8 x) ) d1 (pow (int (sqrt d))) )   
       (println (list d d1)) 
        (if (= d d1)
            true
        )
    )
)  


codedwords)))


(exit)
