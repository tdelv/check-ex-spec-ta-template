#lang racket

(require forge/check-ex-spec/ta)
(require crypto)

(define-values (assignment-name key-path)
  (command-line
    #:args (assignment-name key-path)
    (values assignment-name key-path)))

(define loc (format "~a/~a" assignment-name assignment-name))
(make-directory* (format "../checkexspec-student/~a" assignment-name))
(encrypt-file (read-key key-path)
              (format "~a.rkt" loc)
              (format "../checkexspec-student/~a" loc))

(system (string-append "cd ../checkexspec-student;"
               (format "git add ~a;" loc)
               (format "git commit -m 'Updating assignment ~a.';" assignment-name)
                       "git pull;"
                       "git push;"))
