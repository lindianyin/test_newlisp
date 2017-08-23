(load "./factoral.lsp")

(setq f (map factoral (sequence 0 9)))

(define (facsum n)
    (setq temp n sum 0)
    (while (> temp 0)
        (inc sum (f (% temp 10)))
        (setq temp (/ temp 10))
    )
    sum
)
(setq cnt 0)
(for (i 1 1000000)
    (setq n i r '())
    (while (not (find n r))
       (push n r -1) 
       (setq n (facsum n))
    )
    (when (= 60 (length r))
        (inc cnt)
    )
)


(println cnt)



(exit)
