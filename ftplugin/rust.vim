augroup rustvim
  autocmd! BufWritePre <buffer>
  autocmd BufWritePre <buffer> :Autoformat
augroup END
