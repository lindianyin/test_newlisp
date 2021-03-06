(load "./rational.lsp")
(setq target (list 3 7))
(setq delta 1)
(setq left 0)
(for (d 100000 2)
    (for (n 1 (- d 1 ))
        (setq dta (Q:- target (list n d)))
        (when (and 
                (Q:> dta 0)
                (Q:< dta delta)
              )
           (setq delta dta)
           (setq left (list n d)) 
        )
        
    )
)
(println left)

(exit)
