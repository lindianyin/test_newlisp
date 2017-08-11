
(set 'result 0)
(set 'lower 0)
(set 'n 1)

(while (< lower 10)
    (setq lower (ceil (pow 10 (div (- n 1.0) n ))))
    (inc result (- 10 lower))
    (inc n)
)

(println result)

(exit)
