;;(for (i 1 100) 
;;    (begin
;;        (print i "\r")
;;    )
;;)
(define (my-func a b c)
	(+ a b c))


(println (my-func 1 2 3))


(define (translate n)
    (case n
        (1 "one")
	(2 "two")
	(3 (my-func 4 5 6))
	(true "Can't translate this")))

(println (translate 1))
(println (translate 3))
(println (translate 10))

(set 'persons '(
    (id001 (name "Anne") (address (country "USA") (city "New York")))
    (id002 (name "Jean") (address (country "France") (city "Paris")))
))

(set 'idd 'id001)
(println idd)
(println (assoc '(id001 address) persons))


(exit)
