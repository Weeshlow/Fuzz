#! /usr/bin/env racket

#lang racket

(require "src/replace.rkt")
(require "src/utils.rkt")

;Note you can only run this from the command line otherwise it dies.
;To do so, `racket main.rkt a-url-here`
;I know what the dying issue is, I just haven't fixed it...

(define (call)
  (let*
    ([url (replace
          (vector-ref (current-command-line-arguments) 0)
          "sets/numbers")]
     [curl-call (format "curl --config 'curl.conf' --url '~a'" url)])
    (displayln "===================")
    (displayln curl-call)
    (displayln "===================")
    (displayln url)
    (displayln "===================")
    (displayln curl-call)
    (system curl-call)))

(for ([i 1]) (call))

