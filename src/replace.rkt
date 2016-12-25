#lang racket

(require "utils.rkt")

(define (replace url [set-file-path "sets/any"] )
  (let ([replaced-url ""])
    (set! replaced-url (replace-any url set-file-path))
    (set! replaced-url (replace-strings replaced-url set-file-path))    
    (set! replaced-url (replace-ints replaced-url set-file-path))
    replaced-url))

(define (replace-ints url [set-file-path "sets/numbers"])
  (string-replace* url "/int/" (open-file-as-list set-file-path)))

(define (replace-strings url [set-file-path "sets/strings"])
  (string-replace* url "/string/" (open-file-as-list set-file-path)))

(define (replace-any url [set-file-path "sets/any"])
  (string-replace* url "/any/" (open-file-as-list set-file-path)))

(provide (all-defined-out))