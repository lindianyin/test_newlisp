
(set 'fs 
    (map
        (lambda (x) (int (trim x "0" "")))
    (filter
        (lambda (x) (!= x "")) 
        (parse (read-file "./p067_triangle.txt") " |\n" 0))
    )
    )

(set 'p '())

(set 'idx 0)
(for (i 1 100)
   (push (slice fs idx i) p -1)
   (inc idx i)
)
(println p)
(for (i 98 0)
   (for (j 0 i)
       (inc (p i j) (max  (p (+ i 1) j ) (p (+ i 1) (+ j 1)) )) 
       ;(println p)
    )
)


(println p)


(exit)
