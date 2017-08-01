
(set 'start (time-of-day))
(define (mypow a b)
    (if (= 1 b)  
        (bigint a)
        (* (bigint a) (mypow a (- b 1)))
    )   
)

;(define (mypow a b)
;    (let (r (bigint 1))
;        (while (> b 0)
;           (setq r (* r a)) 
;            (dec b)
;        )
;        r
;    )
;)
(println (mypow 3 2))


(set 'p 203956878356401977405765866929034577280193993314348263094772646453283062722701277632936616063144088173312372882677123879538709400158306567338328279154499698366071906766440037074217117805690872792848149112022286332144876183376326512083574821647933992961249917319836219304274280243803104015000563790123L)
(set 'a 5)

(set 'XA 600L)
(set 'XB 582L)

(set 'YA (% (mypow a XA) p))
(set 'YB (% (mypow a XB) p))

;(println YA)
;(println YB)

(set 'KA (% (mypow YB XA) p))
(set 'KB (% (mypow YA XB) p))

(println KA)
(println KB)

(println (- (time-of-day) start))
(exit)

