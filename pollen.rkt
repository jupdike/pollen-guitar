#lang racket/base

(require racket/string)
(require pollen/tag)
(provide (all-defined-out))

;; guitar chord stuff

(define title (make-default-tag-function 'h1))
(define heading (make-default-tag-function 'h2))
(define sub (make-default-tag-function 'h3))
(define desc (make-default-tag-function 'p))

(define row list)
(define frets list)
(define x -1)

(define-syntax-rule (chord name rhs)
   (define name
      (chordify (symbol->string (quote name)) rhs)))

(define (img url)
  (list 'img (list (list 'src url))) )

(define (chordify name x)
  (let* [(fretstr (string-join (map (λ(y) (format "~a" y)) x) ","))
        (full (string-append "http://www.updike.org/harmony/frets.cgi?"
                             fretstr))]
    (list 'p (img full) '(br) name)  ) )

(define empty-chord (chordify "" '()))
(define _ empty-chord)

(define (song . x)
 `(table ,@(map (λ(row)
             `(tr ,@(map
                 (λ(i) (list 'td '((valign "top")) i)) row))) x)))
