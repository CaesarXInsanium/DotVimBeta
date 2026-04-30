" autopairs can be disabled with <M-p>
let b:AutoPairs = {}
" keyword arguments are higlighted
syntax match GuileKeyword /\(:\)\@<=#\(\w\+\)\(:\)\@=/ contained
" Set highlighting group for the match
syntax match guileSyntax "define-exception-type"
" #ffffff
