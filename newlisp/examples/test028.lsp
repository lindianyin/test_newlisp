;problem 28

(set 'lst '(1))
(for (i 3 1001 2)
    (push (+ (- (* 4(pow i)) (* 6 i)) 6) lst -1)
)
(println (apply + lst))
(exit)

