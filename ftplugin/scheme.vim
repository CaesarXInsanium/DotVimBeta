let b:autopairs_enabled = 0

" keyword arguments are higlighted
syntax match GuileKeyword /\(:\)\@<=#\(\w\+\)\(:\)\@=/ contained
" Set highlighting group for the match
syntax match guileSyntax "define-exception-type"
" #ffffff
