#lang racket

(define (random-choice ls)
  (list-ref ls (random (length ls))))

(define (open-file path-as-string)
  (file->string (string->path path-as-string)))
  

(provide (all-defined-out))