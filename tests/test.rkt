#lang racket

(require rackunit)
(require rackunit/text-ui)
(require "../src/replace.rkt")
(require "../src/utils.rkt")

(define tests
  (test-suite
    "All tests"

      (test-case
        "Test we replace all int tags with items from the integer fixture file"
        (check-equal? (replace "http://www.service.some.url?person=/int/" "fixtures/numbers")  
                     "http://www.service.some.url?person=9999999999999999999999999999999"))
      
      (test-case
        "Test we return the contents of a file as a string"
        (check-equal? (open-file "fixtures/numbers") "9999999999999999999999999999999\n"))

      (test-case
        "Test we bring back the contents of a file as a list separated on new lines"
        (check-equal? (open-file-as-list "fixtures/numbers") '(9999999999999999999999999999999)))

      (test-case
        "Test we replace a string with random elements from an array"
        (check string-contains?
               (string-replace* "hello hello hello hello hello hello" "hello" '("a" "test"))
               "test"))

      (test-case
        "Test we can extract the http code from an HTTP response"
        (check-equal? (get-http-code-from-response (open-file "fixtures/headers/headers-1")) "302"))))

(run-tests tests)