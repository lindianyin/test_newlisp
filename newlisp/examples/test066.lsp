
(define (fraction S)
    (letn (m 0L  d 1L a (bigint (sqrt S)) a0 a lst '()) 
        (catch
        (while true
           (setq m (- (* d a) m)) 
           (setq d (/ (- S (pow m)) d)) 
           (setq a (/ (+ a0 m) d)) 
           (push a lst -1) 
           (if (= (* 2L a0) a)
                (throw)
            )   
        )   
       )   
       lst 
    )   
)


(load "rational.lsp")

(define (diophantine a lst)
    (setq r 0)
    (setq r1 (reverse lst))
    (dolist (x r1) 
        (setq r (Q:/ 1L (Q:+ x r)))
    )
    (Q:+ a r)
)

;(println (fraction 277))
;(println (diophantine 16L '(1L 1L 1L 4L 10L 1L 7L 2L 2L 3L 3L 2L 2L 7L 1L 10L 4L 1L 1L 1L 32L 1L 1L 1L 4L 10L 1L 7L 2L 2L 3L 3L 2L 2L 7L 1L 10L 4L 1L 1L 1L))) 
;(exit)

(set 'result '())
(for (D 2 1000)
    (when (!= (pow (bigint (sqrt D))) D)
        (setq lst (fraction D))
        (setq len (length lst))
        (println len)
        (setq lst (append lst lst))
         (if (odd? len)
            (begin
                (setq idx (- (* 2 len) 1))
                (println idx " " (slice lst 0 idx))
                (setq p (diophantine (bigint (sqrt D)) (slice lst 0 idx)))
                (println D " " p)
                (push (list D p) result -1)
                (when (integer? p)
                    (setq p (list p 1L))
                    (println "--------------------")
                )
                ;(println "==>" D " " (- (* (first p) (first p)) (* (bigint D) (* (last p) (last p)))))
            )
            (begin
               (setq idx (- len 1))
               (setq p (diophantine (bigint (sqrt D)) (slice lst 0 idx)))
               (when (integer? p)
                    (setq p (list p 1L))
                )
               (println D  " " p)
               (push (list D p) result -1)
               ;(println "==>" D " " (- (* (first p) (first p)) (* (bigint D) (* (last p) (last p)))))

            )
         )
    )
)




(println result)

(println (sort result (lambda (a b) (< (a 1 0) (b 1 0)))))





(exit)
