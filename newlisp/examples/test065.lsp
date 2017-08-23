
(define (reducation a b)
    (let ( _a a _b b)
        (if (or (= a 0) (= b 0))
            (list a  b)

            (begin
                (when (integer? a)
                    (setq _a (list (* a a) a))
                )
                (when (integer? b)
                    (setq _b (list (* b b) b))
                )
                ;(println _a)
                ;(println _b)
                
                (setq _gcd (gcd (_a 1) (_b 1)))
                (setq _p (/ (* (_a 1) (_b 1)) _gcd))
                (setq _p0 (* (/ _p (_a 1)) (_a 0)))
                (setq _p1 (* (/ _p (_b 1)) (_b 0)))
                (setq _gcdp (gcd _p0 _p1))
                (list (bigint (/ _p0 _gcdp)) (bigint (/ _p1 _gcdp)))
             
            )
        ) 
    )
)


(define (rtadd a b)
    (let (_a a _b b)
        (cond 
            ((= a 0) b)
            ((= b 0) a)
           
            (begin
                (when (integer? a)
                    (setq _a (list (* a a) a))
                )
                (when (integer? b)
                    (setq _b (list (* b b) b))
                )
                (println "rtadd " a b)
                (reducation (+ (* (_a 0) (_b 1)) (* (_a 1) (_b 0))) (* (_a 1) (_b 1)))

            ) 
            
        )
    )
)



(define (fraction n)
    (if (= n 1)
        (list 1 2)

        (begin
        (setq a 2)
        (setq b (fraction (- n 1)))
        (setq c (rtadd a b)) 
        (reducation 1 c)
        )
    )
)


(define (mycal n)
    (rtadd 1 (fraction n))
)


;(println (mycal 1))
;(println (mycal 2))
;(println (mycal 3))
;(println (mycal 4))
;(println (mycal 11))


;e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

;(println (rtadd 1 (list 1 4))) 

(set 'r
(flat (map (fn (x) (list 1L (* 2L x) 1L)) (sequence 1 100)))
)
(set 'r1 (reverse (slice r 0 99)))
(println r1)

(set 'r3 0)

(load "rational.lsp")

(dolist (x r1)
    (setq r4 (Q:+ x r3))
    (setq r3 (Q:/ 1L r4))
)

(set 'r5 (Q:+ 2L r3))

(println r5 " " (div (first r5) (last r5)))

(println (apply + (map int (explode (trim (string (first r5)) "" "L")))))





(exit)
