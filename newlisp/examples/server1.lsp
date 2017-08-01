;(set 'listen-list '(1001 1002))

; accept-connection, read-connection and write-connection
; are user defined functions

(set 'listen-list (list (net-listen 1111) (net-listen 1112)))

(set 'accept-list '())

(define (accept-connection conn)
    (begin
        (set 'connect (net-accept conn))
        (println "accept-connection connect=" connect) 
        (if (not (find connect accept-list))
            (push connect accept-list -1)
            (println "accept-list="  accept-list) 
        )
    )
)

(define (read-connection conn)
    (let (n nil)
        (println "read-connection conn=" conn)
        (setq n (net-peek conn))
        (println n)
        (if (and (!= 0 n) (!= nil n))
            (begin
                (net-receive conn buff n)
                (println accept-list)
                (println buff)
                (net-send conn (reverse buff))
            )
            (begin
                (pop accept-list (find conn accept-list) )
            )
        ) 
    )
)

(define (write-connection conn)
    (begin
        (println "write-connection conn=" conn)
    )
)

(set 'tick  (int (time-of-day)))

(while (not (net-error))
    (dolist (conn (net-select listen-list "r" 1000))
    (accept-connection conn))  ; build an accept-list

    (dolist (conn (net-select accept-list "r" 1000))
    (read-connection conn))    ; read on connected sockets


    (dolist (conn (net-select accept-list "w" 1000))
    (write-connection conn))    ; write on connected sockets

     (if (> (- (int (time-of-day)) tick) 1000)  
        (begin
            (println "tick delta=" (- (time-of-day) tick))
            (setq tick (int (time-of-day)))            
        )
     ) 
)

(println (net-error))

(exit)
