#lang racket

(require forge/check-ex-spec/ta)
(require crypto)

(define student-directory "<insert-name-of-student-github-repo>")

(define-values (assignment-name key-path)
  (command-line
    #:args (assignment-name key-path)
    (values assignment-name key-path)))

(define loc (format "~a/~a" assignment-name assignment-name))
(make-directory* (format "~a/~a" student-directory assignment-name))
(encrypt-file (read-key key-path)
              (format "~a.rkt" loc)
              (format "~a/~a" student-directory loc))

(system (string-append (format "cd ~a;" student-directory)
                       (format "git add ~a;" loc)
                       (format "git commit -m 'Updating assignment ~a.';" assignment-name)
                               "git pull;"
                               "git push;"))
