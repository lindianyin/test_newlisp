(define (prim? n)
    (begin
        (setq r (factor n))
        (and 
            (!= nil r)
            (= 1(length r))
        )
    )
)

(define (toint n)
    (int (trim n "0" "")) 
)


(define (truncatable? n)
    (letn (s (string n) len (length s))
       (for (i 0 (- len 1))
            (setq tmp (slice s i (- len i))) 
            ;(println tmp)
            (if (not (prim? (toint tmp)))
                (throw false)
            )
       )
       (for (i 0 (- len 1))
            (setq tmp (slice s 0 (- len i))) 
            ;(println tmp)
            (if (not (prim? (toint tmp)))
                (throw false)
            )
       ) 
       (throw true)
    ) 
)

(println (catch (truncatable? 3797)))
(println (catch (truncatable? 57107)))

(set 'result '())
(set 'idx 10)
(catch 
(while true
   (if (catch (truncatable? idx))
        (begin
            (push idx result -1) 
            ;(println idx)
            (if (= 11 (length result))
                (throw result)
            )
        )  
   )
   (inc idx) 
)
)

(println (apply + result))


(exit)
