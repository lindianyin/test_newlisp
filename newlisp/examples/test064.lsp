
(define (square n)
    (setq _a0 (int (sqrt n))) 
    (setq _x1 (div 1 (sub (sqrt n) _a0)))
    (setq _result (list _a0))
    (setq _cnt 0)
    (catch 
    (while true
        (setq _a0 (int _x1))
        ;(println _a0)
        (setq _x1 (div 1 (sub _x1  _a0))) 
        ;(push _a0 _result -1)
        (inc _cnt)
        (when (= _a0 (* 2 (_result 0)))
            (throw)
        ) 
    )
    )
    _cnt
)

(set 'lst (filter (lambda (x) (!= (pow (int (sqrt x))) x)) (sequence 23 23)))
(println lst)

(set 'result
(map square lst)
)
(println result)
(println (length (filter odd? result)))


(exit)
