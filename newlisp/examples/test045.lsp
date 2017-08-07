(setq cnt 100000)
(setq t 
    (map (fn (x) (/ (* x (+ x 1)) 2) ) (sequence 1 cnt))
)
(setq p 
    (map (fn (x) (/ (* x (- (* 3 x) 1)) 2) ) (sequence 1 cnt))
)
(setq h 
    (map (fn (x) (* x (- (* 2 x) 1)) ) (sequence 1 cnt))
)


;(println (list t p h))

(println (intersect (intersect t p) h))

(exit)
