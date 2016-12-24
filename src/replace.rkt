#lang racket

(require "utils.rkt")

(define (replace url set-file-path)
  (let ([replaced-url ""])

    (set! replaced-url
      (string-replace*
         url
         "/any/"
         (open-file-as-list set-file-path)))
  
    (set! replaced-url
      (string-replace*
        replaced-url
        "/string/"
        (open-file-as-list set-file-path)))
        
    (set! replaced-url
      (string-replace*
        replaced-url
        "/int/"
        (open-file-as-list set-file-path)))
    
    replaced-url))

(provide (all-defined-out))