" Vim plugin to fit the Sedona coding style and help sedona development
"
" This script is inspired from an article written by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style
" and various user comments.

if exists("g:loaded_sedonacs")
    finish
endif
let g:loaded_sedonacs= 1

function! SetSedonaFormatting()
    autocmd!

    autocmd FileType c,cpp call s:SedonaSettings()
    autocmd FileType c,cpp call s:SedonaKeywords()
    autocmd FileType c,cpp call s:SedonaHighlighting()

    filetype detect
endfunc

command! SetSedonaFormatting call SetSedonaFormatting()

function s:SedonaSettings()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0

    setlocal wildignore+=*.o
endfunction

function s:SedonaKeywords()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
endfunction

function s:SedonaHighlighting()
    highlight default link SedonaError ErrorMsg

    syn match SedonaError / \+\ze\t/     " spaces before tab
    syn match SedonaError /\s\+$/        " trailing whitespaces
    syn match SedonaError /\%81v.\+/     " virtual column 81 and more
endfunction

" vim: ts=4 et sw=4
