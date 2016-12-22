#lang racket

(require rackunit)
(require "../src/replace.rkt")
(require "../src/utils.rkt")


(check-eq? (replace "http://www.service.some.url?person={{INT}}" "fixtures/numbers")  
           "http://www.service.some.url?person=9999999999999999999999999999999" 
           "Failed to replace all int tags with items from the integer set :(")

;Fails for some reason even though they match...?
(check-eq? (open-file "fixtures/numbers")
           "9999999999999999999999999999999\n"
           "Failed to get the contents of the file")
                      