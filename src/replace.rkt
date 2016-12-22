#lang racket

(require "utils.rkt")

(define (replace url set-file-path)
  (string-replace*
     url
     "/int/"
     (open-file-as-list set-file-path)))

;Export all the functions
(provide (all-defined-out))