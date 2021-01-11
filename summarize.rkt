#lang racket

(require racket/cmdline)
(require json)

(define-values (assignment-name provides)
  (command-line #:args (assignment-name . provides) 
                (values assignment-name provides)))

(define (get-files group)
  (define directory-name (format "./assignments/~a/~a" assignment-name group))
  (define paths (directory-list directory-name))
  (define paths-wo-ext (map (lambda (path) (path-replace-extension path #"")) paths))
  (define file-names (map path->string paths-wo-ext))
  file-names)

(define info 
  (hash
    'name assignment-name
    'wheats (get-files "wheats")
    'chaffs (get-files "chaffs")
    'provides provides))



(with-output-to-file (format "./compiled/~a/summary-~a.json" assignment-name assignment-name)
  (thunk (write-json info)))
