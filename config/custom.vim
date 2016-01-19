" Always switch to the current file directory
if !exists('g:no_autochdir')
		autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
endif

au FocusLost * silent! wa
