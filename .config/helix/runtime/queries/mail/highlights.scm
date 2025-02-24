(ERROR) @diagnostic.error
; header fields
[
  (header_field_email)
  (header_field_subject)
  (header_field)
] @keyword

(header_separator) @punctuation.delimiter
(email_delimiter) @punctuation.delimiter

(header_subject
  (subject) @markup.bold)
(header_other
  (header_unstructured) @comment)

; Firstname Lastname
(atom) @variable

; Email Address
; currently this includes the wrapping <>, can we change this?
(email) @string

(quote_marker) @punctuation.special
(quote_contents) @markup.quote

