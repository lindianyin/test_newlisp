(define (mypow a b)
	(if (= 1L b) 
		a 
		(* a (mypow a (- b 1)))))
