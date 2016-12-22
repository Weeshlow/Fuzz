#lang racket

(define (random-choice ls)
  (list-ref ls (random (length ls))))

(define (open-file path-as-string)
  (file->string (string->path path-as-string)))

(define (open-file-as-list path-as-string)
  (file->list (string->path path-as-string)))

;like string replace but it can use a different 'to' each time. i.e. random choices
;(string-replace* "boo boo boo" "boo" '("bl" "po" "to")) => "po bl po"
(define (string-replace* subject from tos)
  (let* ([choice (random-choice tos)]
         [replaced (string-replace subject from (format "~a" choice) #:all? #f)])
    (if (string-contains? replaced from)  
        (string-replace* replaced from tos)
        replaced)))

(define (get-http-code-from-response response)
  (list-ref (string-split response) 1))

(define (type? x)
  (cond
    [number? "number"]
    [string? "string"]
    [list? "list"]
    [byte? "byte"]
    [else "unknown type"]))
  
(provide (all-defined-out))