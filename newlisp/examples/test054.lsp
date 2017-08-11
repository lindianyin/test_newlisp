

(set 'pkn '("2" "3" "4" "5" "6" "7" "8" "9" "T" "J" "Q" "K" "A"))
(set 'pkc '("H" "C" "S" "D"))
(set 'pks (filter (lambda (x) (!= x "")) (parse (read-file "./p054_poker.txt") " |\n" 0)))

(set 'pks1
    (map (lambda (x)
        (setq e (explode x))
        (setq n (find (e 0) pkn))
        (setq c (find (e 1) pkc))
        (list e n c)
    )
    pks)
)

(set 'pks2 (array 1000 10 pks1))

(define (straight n)
    (setq r (sort n (lambda (a b) (< (a 1) (b 1)) )))
    (setq tp (= 5 (+ 1 (- (r -1 1) (r 0 1)))))
    (list (list 'tp tp ) (list 'rt (r 0 1)))
)


(define (samesuit n)
    (setq r (sort n (lambda (a b) (< (a 2) (b 2)) )))
    (println r)
    (= (r -1 2) (r 0 2))
)


(define (groupby n)
    (setq lst (map (lambda (x) (x 1)) n))
    (setq lst1 (unique (map (lambda (x) (x 1)) n)))
    (sort  (map (lambda (x) (ref-all x lst = true )) lst1) (lambda (a b) (< (length a) (length b))))
)






;(set 'demo '((("3" "H") 1 0) (("7" "H") 5 0) (("6" "S") 4 2) (("K" "C") 11 1) (("J" "S") 9 2)))
;(set 'demo '((("3" "H") 1 0) (("7" "H") 5 0) (("6" "S") 4 2) (("4" "C") 2 1) (("5" "S") 3 2)))
(set 'demo '((("3" "H") 1 0) (("7" "H") 5 0) (("6" "H") 2 0) (("4" "H") 3 0) (("4" "H") 4 0)))


;(println demo)
(println (straight demo))
;(println (samesuit? demo))
;(println (groupby demo))



(exit)

