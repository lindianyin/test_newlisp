
(define (reducation a b)
    (let ( _a a _b b)
    (when (integer? a)
        (setq _a (list (* a a) a))
    )
    (when (integer? b)
        (setq _b (list (* b b) b))
    )
    
    (setq _gcd (gcd (_a 1) (_b 1)))
    (setq _p (/ (* (_a 1) (_b 1)) _gcd))
    (setq _p0 (* (/ _p (_a 1)) (_a 0)))
    (setq _p1 (* (/ _p (_b 1)) (_b 0)))
    (setq _gcdp (gcd _p0 _p1))
    (list (/ _p0 _gcdp) (/ _p1 _gcdp))
    )
)


(define (rtadd a b)
    (let (_a a _b b)
        (when (integer? a)
            (setq _a (list (* a a) a))
        )
        (when (integer? b)
            (setq _b (list (* b b) b))
        )
        (reducation (+ (* (_a 0) (_b 1)) (* (_a 1) (_b 0))) (* (_a 1) (_b 1)))
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


(println (mycal 1))
(println (mycal 2))
(println (mycal 3))
(println (mycal 4))
(println (mycal 11))


;e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].














(exit)
