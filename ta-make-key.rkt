#lang racket

(require forge/check-ex-spec/encrypt-decrypt/library)

(define key (generate-key #t))
(write-key-to-file key "key")
