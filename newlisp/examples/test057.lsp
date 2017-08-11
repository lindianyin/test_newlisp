
(define (convergent n)
    (setq a '(1L 2L))
    (dotimes (i n)
        (setq (a 0) (+ (a 0) (* 2L (a 1))))
        ;(println a)
        (swap (a 0 ) (a 1))
        ;(println a)
    ) 
    ;(println a)
    (setq (a 0) (+ (a 0) (* 1L (a 1))))
     a
)

;(println (convergent 0))
(println (convergent 1))
(println (convergent 2))
(println (convergent 3))

(println)
(println
(length 
(filter (lambda (x)  (> (length (string (x 0))) (length (string (x 1))))  ) (map convergent (sequence 0 999)))
)
)

(exit)
