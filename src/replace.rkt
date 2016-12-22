#lang racket

(require "utils.rkt")

(define (replace url set-file-path)
  (string-replace*
     url
     "/int/"
     (open-file-as-list set-file-path)))

(provide (all-defined-out))