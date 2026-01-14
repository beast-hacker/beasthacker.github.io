#lang racket

(define languages
  (list
    (hash   'name       "Python"
            'prompt     ">>> "
            'syntax     "print"
            'next-lang  "JavaScript"
            'filename   "python.html")
    (hash   'name       "JavaScript"
            'prompt     "> "
            'syntax     "console.log"
            'next-lang  "Racket"
            'filename   "javascript.html")
    (hash   'name       "Racket"
            'prompt     "> "
            'syntax     "displayln"
            'next-lang  "Elixir"
            'filename   "racket.html")
    (hash   'name       "Elixir"
            'prompt    "iex> "
            'syntax     "IO.puts"
            'next-lang  "Python"
            'filename   "elixir.html")))

(define (generate-html lang)
  (string-append
    "<!doctype html>\n"
    "<html>\n"

    "<head>\n"
    "  <meta charset=\"utf-8\">\n"
    "  <title>" (hash-ref lang 'name) " - Hello World Loop</title>\n"
    "</head>\n"

    "<body>\n"
    "  <h1>" (hash-ref lang 'name) "</h1>\n"
    "  <p>Say Hello, " (hash-ref lang 'next-lang) "!</p>\n"
    "</body>\n"

    "</html>\n"))

; Write HTML file for one language
(define (write-html-file lang)
  (define filename (string-append "../hello-world/test/" (hash-ref lang 'filename)))
  (display-to-file (generate-html lang) filename #:exists 'replace))

; Generate all HTML files
(for ([lang languages])
  (write-html-file lang)
  (displayln (string-append "Generated " (hash-ref lang 'filename))))
