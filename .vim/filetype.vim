au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx

augroup filetypedetect
    autocmd! BufRead,BufNewFile *.p6 setfiletype perl6
augroup END
