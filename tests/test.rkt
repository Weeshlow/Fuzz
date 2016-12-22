#lang racket

(require rackunit)
(require "../src/replace.rkt")
(require "../src/utils.rkt")


(check-equal? (replace "http://www.service.some.url?person=/int/" "fixtures/numbers")  
              "http://www.service.some.url?person=9999999999999999999999999999999" 
              "Test we replace all int tags with items from the integer set :(")

(check-equal? (open-file "fixtures/numbers")
              "9999999999999999999999999999999\n"
              "Test we get the contents of a file")

(check-equal? (open-file-as-list "fixtures/numbers")
              '(9999999999999999999999999999999)
              "Test we bring back a list of the lines of a file")

;Need a real test for this but my knowledge of rackunit is limited
;Basically, we want to test whether the replacements that are occurring are in the given array.
(display (string-replace* "hello hello hello hello is that okay?" "hello" '("these" "are" "some" "replacement" "words")))

