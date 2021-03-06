(define is_it (lambda(x)
	(cond
     ((eq? 'foo 'foil) 'hello)
     ((eq? x 4) 'goodbye)
     ((= x 4) (quote(twice)))
     (#t 'sorry))
     ))

(is_it 4)

(quote hello)
(quote (1,2,3,4))
;; ' is the same as quote (), syntactic sugar
;;temp var
(let 
  ((x 10)
   (y 20))
  (+ x y)
  )

;; anonymous function
(lambda (x) (* x x))

(equal? '(1 2) '(1 2)) ;;if look the same, true
(eq? '(1 2) '(1 2)) ;;compare objects, false

;;quoting
(define foo '(1 2 3))
foo

;; make list w/ cons:
(define bar (cons 1 (cons 2 (cons 3 ()))))
bar

;; list keyword
(define foo2 (list 1 2 3 4))
foo2

;;list processing

;;null
(null? '()) ;;true, #t
(null? '(1 2)) ;;false, #f

;;cdr
(cdr (cdr '(1 2 3))) ;;pop first two elements off front, return remainder of list

;;car
(car '(2 2 3 4)) ;;pop first two elements off back, return that element
;;(null? (var))


;;iteration via recursion, x^n
(define expt 
  (lambda(x n) 
	(cond ((= n 0) 1)
    		(#t (* x (expt x (- n 1)))))))
(expt 2 5)

(define length1 
  (lambda (a-list)
    (cond ((null? a-list) 0)
          (#t (+ 1 (length1 (cdr a-list)))))))

(length1 '(1 2 3 4 5))

;; Higher order functions from cheat sheet
;; compose: takes two functions and arg, return (f (g x))
(define compose 
  (lambda (f g x)
    (f (g x))))
(compose even? (lambda (x) (- x 1)) 10) ;;  => #f

;; takes a function and applies it to every element of a list
(define map 
  (lambda (f a-list)
    (cond ((null? a-list) a-list)
	  (#t (cons (f (car a-list)) (map f (cdr a-list)))))))

(map even? '(1 2 3 4))        ;;=> (#f #t #f #t)

(define factorial 
  (lambda(x) 
    (cond ((= x 1) 1)
     	(#t (* x (factorial (- x 1)))))))
;(factorial 3)

(define expt1 
  (lambda(x n) 
	(cond ((= n 0) 1)
    		(#t (* x (expt1 x (- n 1)))))))
;(expt1 2 5)

(define sum
  (lambda(a)
    (cond ((= a 0) 0)
          (#t (+ a (sum (- a 1)))))))
;(sum 45)

(define dot
  (lambda(arr1 arr2)
	  (cond ((and (null? arr1) (null? arr2)) ())
        
		(#t 
         (cons (*(car arr1)(car arr2)) 
            (dot (cdr arr1) (cdr arr2)))))))


(define arr1 '(2 3 4))
(define arr2 '(2 3 4))
(dot arr1 arr2)
;(*(car arr1) (car arr2))
(cdr '(1 2))


(cons (*(car arr1) (car arr2)) '())

(and (null? arr1) (null? arr2)

(define (factorial n)
  (cond 
   ((= n 0) 1)
   (#t (* n (factorial (- n 1))))
  )
 )
(factorial 4)

(define compose 
  (lambda (f g x)
    (f (g x))))

(compose (lambda (y) (* y y)) (lambda (x) (+ 3 x)) 3)

(define allEven 
  (lambda (arr)
    (cond 
     ((null? arr) #t)
     (#t (and (= 0 (modulo (car arr) 2)) (allEven (cdr arr))))
    )))

(allEven '(3 2 6 4))

(define map1
  (lambda (arr f)
  (cond 
   ((null? arr) '())
    (#t (cons (f (car arr)) (map1 (cdr arr) f)))
   )
 ))

(define func 
  (lambda (x) 
    (+ x 10)))

(define arr '(1 2 3 4 5)')
(map1 arr func)

(define reverse 
  (lambda (l)
    (cond
     ((null? l) 
      '())
     (#t (append (reverse (cdr l)) (list (car l))) )
     )
    ))

(reverse '(1 2 3 4))