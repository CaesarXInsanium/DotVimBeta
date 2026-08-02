setlocal nu
setlocal keywordprg=:Man\ 3
setlocal colorcolumn+=80
let b:ale_fixers = [
  \   'clang-format',
  \]
