#lang racket

(define (random-choice ls)
  (list-ref ls (random (length ls))))

(define (open-file path-as-string)
  (file->string (string->path path-as-string)))

(define (open-file-as-list path-as-string)
  (file->list (string->path path-as-string)))

(define (type? x)
  (cond
    [number? "number"]
    [string? "string"]
    [list? "list"]
    [byte? "byte"]
    [else "unknown type"]))
  
(provide (all-defined-out))