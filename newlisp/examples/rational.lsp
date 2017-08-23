(context 'Q)

;; rational library functions written by Eddie Rucker September 24, 2004
;;
;; Updated on November 30, 2004. The relations were not working properly
;; major code cleanup
;; Updated on December 7th, 2006. Now uses built-in 'gcd' introduced in 9.0
;;
;; This library has no warranty of any kind
;;
;; include the library by adding (load "rational.lsp") before use
;;
;; rational numbers can have the form
;; a        :: integer
;; '(a)     :: integer
;; '(a b)   :: a = numerator, b = denominator
;; '(a b c) :: mixed number a = whole part, b = numerator, c = denominator
;; 
;; rational numbers must NOT be quoted
;; example
;; (Q:+ 1 '(-1 2) '(1 1 2)) => 2
;; (Q:+ '(1 2) '(1 3)) => (5 6)
;;
;; operators
;; Q:+  :: add rationals - multiple arguments
;; Q:-  :: subtract rationals - multiple arguments
;; Q:*  :: multiply rationals - multiple arguments
;; Q:/  :: divide rationals - multiple arguments
;; Q:neg :: take the opposite of a rational - single argument
;; Q:abs :: take the absolute value of a rational - single argument
;; Q:recip :: take the reciprical of a rational - single argument
;; Q:min :: return the smallest rational value - multiple arguments
;; Q:max :: return the largest rational value - multiple arguments
;;
;; relations
;; Q:=  :: compare rationals for equality (multiple arguments)
;; Q:!=  :: not equals with multiple arguments
;; Q:<  :: less than with multiple arguments
;; Q:>  :: greater than with multiple arguments
;; Q:<=  :: less than or equal to with multiple arguments
;; Q:>=  :: greater than or equal to with multiple arguments

(define (frac-form a b)
  ;; fix negatives so that -a/-b => a/b, a/-b => -a/b
  (if 
    (= a 0)  '(0L 1L)
    (= b 0)  (throw "rational-number-error")
    (and (< a 0) (< b 0))  (list (MAIN:abs a) (MAIN:abs b))
    (and (>= a 0) (< b 0))  (list (MAIN:abs a) (MAIN:abs b))
    (list a b)))

(define (improper A)
  ;; convert a -> a/1 and  a b/c -> (c*a+b)/c
  (apply frac-form
     (if (integer? A)
         (list A 1L)
       (case (length A)
         (1 (list (first A) 1L))
         (2 A)
         (3 (list (+ (nth 1 A) (* (first A) (last A))) (last A)))
         (throw "rational-number-error")))))

(define (reduce-frac A)
  (letn (a (first A) b (last A) dd (gcd (MAIN:abs a) b))
    (if (= dd b)
    (/ a dd)
      (list (/ a dd) (/ b dd)))))

(define (neg_ A)
  (list (- 0L (first A)) (last A)))

(define (add_ A B)
  (let (n0 (first A) d0 (last A) n1 (first B) d1 (last B))
    (list (+ (* n0 d1) (* n1 d0)) (* d0 d1))))

(define (sub_ A B)
  (add_ A (neg_ B)))

(define (mul_ A B)
  (when (nil? B)
    (setq B (list 1L 1L))
  )
  (let (n0 (first A) d0 (last A) n1 (first B) d1 (last B))
    (list (* n0 n1) (* d0 d1))))

(define (recip_ A)
  (list (last A) (first A)))

(define (div_ A B)
  (mul_ A (recip_ B)))

(define (min_ A B)
  (if (< (* (first A) (last B)) (* (first B) (last A)))  A  B))

(define (max_ A B)
  (if (> (* (first A) (last B)) (* (first B) (last A)))  A  B))

(define (bop sm vals)
  ;; binary operator
  (reduce-frac (apply sm (map improper vals) 2)))

(define (uop sm val)
  ;; unary operator
  (reduce-frac (sm (improper val))))

(define (rel_ sm a b L tf)
  (if 
    (= tf nil) nil
    (= L '()) tf
    (let (n (first (first L)) d (last (first L)))
      (rel_ sm n d (rest L) (sm (* a d) (* b n))))))

(define (rel sm vals)
  (let (L (map improper vals))
    (rel_ sm (first (first L)) (last (first L)) (rest L) true)))

;; functions for use in  Q
(constant 'Q:+ (lambda-macro () (bop add_ (map eval (args)))))
(constant 'Q:- (lambda-macro () (bop sub_ (map eval (args)))))
(constant 'Q:* (lambda-macro () (bop mul_ (map eval (args)))))
(constant 'Q:/ (lambda-macro () (bop div_ (map eval (args)))))
(constant 'Q:min (lambda-macro () (bop min_ (map eval (args)))))
(constant 'Q:max (lambda-macro () (bop max_ (map eval (args)))))

(constant 'Q:= (lambda-macro () (rel MAIN:= (map eval (args)))))
(constant 'Q:!= (lambda-macro () (not (rel MAIN:= (map eval (args))))))
(constant 'Q:< (lambda-macro () (rel MAIN:< (map eval (args)))))
(constant 'Q:> (lambda-macro () (rel MAIN:> (map eval (args)))))
(constant 'Q:<= (lambda-macro () (rel MAIN:<= (map eval (args)))))
(constant 'Q:>= (lambda-macro () (rel MAIN:>= (map eval (args)))))

(constant 'Q:abs (fn (A) (list (MAIN:abs (first A)) (MAIN:abs (last A)))))
(constant 'Q:neg (fn (A) (uop neg_ A)))
(constant 'Q:recip (fn (A) (uop recip_ A)))

(context 'MAIN)



