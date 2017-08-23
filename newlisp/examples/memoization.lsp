; speed up a recursive function using memoization
(define-macro (memoize mem-func func)
    (set (sym mem-func mem-func)
        (letex (f func  c mem-func)
          (lambda ()
              (or (context c (string (args)))
              (context c (string (args)) (apply f (args))))))))

;(memoize factor-m factor)

;(println (time (factor-m 10240)))
;(println (time (factor-m 10240)))
;(println (time (factor-m 10240)))

;(exit)
