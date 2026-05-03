setlocal keywordprg=:Man\ 3
augroup cvim
  autocmd! BufWritePre <buffer>
  autocmd BufWritePre <buffer> :Autoformat
augroup END
