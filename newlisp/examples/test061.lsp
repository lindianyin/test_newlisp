
(define (fter n)
    (and 
        (>= n 1000)
        (<= n 9999))
)

(define (spt n)
    (list 
        (int (trim (slice (string n) 0 2) "0" ""))
        (int (trim (slice (string n) -2 2) "0" ""))
    )
)

(define (fter1 n)
    (not 
        (or 
            (< (n 0) 10)
            (< (n 1) 10)
        )
    )
)




(set 'p3 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n (+ n 1)) 2 )) (sequence 1 1000))))))
(set 'p4 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n n ) 1 )) (sequence 1 1000))))))
(set 'p5 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n (- (* 3 n) 1) ) 2 )) (sequence 1 1000))))))
(set 'p6 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n (- (* 2 n) 1) ) 1 )) (sequence 1 1000))))))
(set 'p7 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n (- (* 5 n) 3) ) 2 )) (sequence 1 1000))))))
(set 'p8 (filter fter1 (map spt (filter fter (map (lambda (n) (/ (* n (- (* 3 n) 2) ) 1 )) (sequence 1 1000))))))

(set 'plist (list p4 p5 p6 p7 p8))


;(println p3)
;(println p4)
;(println p5)
;(println p6)
;(println p7)
;(println p8)

(println plist)






(exit)
