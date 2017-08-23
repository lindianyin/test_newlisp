(load "./rational.lsp")

(define (fai n)
    ;(apply Q:* (map (lambda (x) (Q:- 1 (Q:/ 1 x))) (unique (factor n))))
    (Q:* n (apply Q:* (map (lambda (x) (Q:- 1L (Q:/ 1L (bigint x)))) (map bigint (unique (factor n))))))
)

;(println (fai 7L))
(setq mx 0)
(setq mi 0)
(setq mf 0) 
(for (i 2 1000000)
    (setq f (fai i))
    (if (= (sort (explode (string f))) (sort (explode (string i))) )
        ;(println i " " (fai i) " " (Q:/ (bigint i) (fai i)))
        (begin
            (setq _m (Q:/ (bigint i) f))
            (when (> _m mx)
                (setq mx _m)
                (setq mi i)
                (setq mf f)
            )  
        )
    )
)

(println mx)
(println mi)
(println mf)


(exit)

