;;Multiples of 3 and 5
;;If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;Find the sum of all the multiples of 3 or 5 below 1000.
(define (problem-1)
   (apply add (filter 
    (lambda (x) (or (= 0(mod x 3)) (= 0 (mod x 5))) )
    (sequence 1 999)))
)
(println (problem-1))

;;Even Fibonacci numbers
;;Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
;;1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
;;By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

(define (fib n)
    (if (= 1 n) 
        1
        (if (= 2 n)
            2 
            (+ (fib (- n 1)) (fib (- n 2)))
	)
    ) 	
)


(define (problem-2)
   (let (x 0 y 1 sum 0)
       (while (<= (setq y (+ x (swap y x))) 4000000)
           (when (even? y) (inc sum y)) 
       )
   )
)

(println (problem-2))


;;Largest prime factor
;;The prime factors of 13195 are 5, 7, 13 and 29.
;;What is the largest prime factor of the number 600851475143 ?

(define (problem-3)
    (last (factor 600851475143)) 
)

(println (problem-3))

(define (primes f t)
   (local (r)
       (for (i f t)
           (if (=(length (factor i)) 1) (push i r -1))
       )
   r
   )
)

(println (primes 1 100))


;;Sum square difference
;;The sum of the squares of the first ten natural numbers is,
;;
;;12 + 22 + ... + 102 = 385
;;The square of the sum of the first ten natural numbers is,
;;
;;(1 + 2 + ... + 10)2 = 552 = 3025
;;Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
;;
;;Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

(define (problem-4)
    (sub 
        (pow (apply add (sequence 1 100)))
        (apply add (map pow (sequence 1 100)))
    )
)


(println (problem-4))


;;Smallest multiple
;;2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

;;What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?





;;10001st prime
;;Problem 7
;;By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
;;What is the 10 001st prime number?


(define (problem-7)
    (let (n 2 c 0)
        (begin
            (while (< c 10001)
                (if (=(length (factor n)) 1)
                    (begin (inc c) (inc n) )
                    (inc n)
	        )
            )
            (dec n)
        )
    )
)

(println (problem-7))

;Special Pythagorean triplet
;Problem 9
;A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;a^2 + b^2 = c^2
;For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;Find the product abc.


(define (problem-9)
    (for (i 1 1000)
        (for (j i 1000)
            (for (k j 1000)
                (if 
                    (and (= (+ (pow i) (pow j)) (pow k)) 
                         (= (+ i j k) 1000) 
                         (< i j)
                         (< j k)
                    )
                    (throw (* i j k))
                    ;(println i " " j " " k)
                )
            )
        )
    )
)

;(println (catch (problem-9)))


;;(println (apply add (primes 1 2000000)))


(define (divisors n,r)
    (begin
        (for (i 1 n)
            (if (= (mod n i) 0)
                (push i r -1) 
            )
        ) 
        r
    )
)

;(println (divisors 28))

(define (problem-12)
    (let (n 1 t 0 len 0)
        (while true  
               (setq t (/ (* (+ 1 n) n) 2))
               (setq len (length (divisors t)))
               (if (> len  500)
                   (throw t)  
               )
               ;(println n " " t " " len)
              (inc n)
        )
    )
)

;(println (catch (problem-12)))



(define (testlet)
    (let (n 0)
        (while (< n 10)
            (inc n) 
            (println n) 
        )
    )
)

;(testlet)


(define (collatz n)
    (let (c 0 r '())
        (while (!= n 1)
            (push n r -1)
            (inc c)
            (if (even? n)
                (setq n (/ n 2))
                (setq n (+ (* n 3) 1)) 
            )
        )
        (inc c)
        (push 1 r -1)
        (list c r) 
        (println (list c r))
    )
)


(define (problem-14)
    (let (vl 0 idx 0 mx 0)
        (for (i 1 100000)
            (setq vl ((collatz i) 0 0))
            (if (> vl mx)
                (setq mx vl idx i)
   
            ) 
        )
        (println vl " " idx)
    )
)


;(println (collatz 13))


(problem-14)













(exit)
