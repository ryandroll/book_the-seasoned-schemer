#lang racket
(require "../misc.rkt")
(provide (all-defined-out))

(define is-first?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (eq? (car lat) a)))))

(define two-in-a-row?-1
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (or (is-first? (car lat) (cdr lat))
                (two-in-a-row?-1 (cdr lat)))))))

;; Test
(define test-lst '(Italian sardines sardines spaghetti parsley))
(two-in-a-row?-1 test-lst)

(define is-first-b?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (two-in-a-row?-2 lat))))))

(define two-in-a-row?-2
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (is-first-b? (car lat) (cdr lat))))))

;; test
(two-in-a-row?-2 test-lst)

;; final
(define two-in-a-row-b?
  (lambda (preceding lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) preceding)
                (two-in-a-row-b? (car lat) (cdr lat)))))))

(define two-in-a-row?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else (two-in-a-row-b? (car lat) (cdr lat))))))

;; test
(two-in-a-row? test-lst)
