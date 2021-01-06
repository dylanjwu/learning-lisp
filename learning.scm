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

(equal? '(1,2) '(1,2)) ;;if look the same, true
(eq? '(1,2) '(1,2)) ;;compare objects, false

;;quoting
(define foo '(1,2,3))
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
(null? '(1,2)) ;;false, #f

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

(length1 '(1,2,3,4,5))

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