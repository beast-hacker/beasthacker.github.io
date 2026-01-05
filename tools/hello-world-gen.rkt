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
            'filename   "JavaScript.html")
    (hash   'name       "Racket"
            'prompt     "> "
            'syntax     "displayln"
            'next-lang  "Elixir"
            'filename   "racket.html")
    (hash   'name       "Elixir"
            'promopt    "iex> "
            'syntax     "IO.puts"
            'next-lang  "Python"
            'filename   "elixir.html")))

; Test: print all the language names

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

    (displayln (generate-html (first languages)))