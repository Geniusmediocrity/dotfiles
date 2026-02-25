if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'coctree') ==# -1
    call add(g:sonokai_loaded_file_types, 'coctree')
else
    finish
endif
" syn_begin: coctree {{{
" https://github.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Purple
highlight! link CocTreeDescription Grey
for kind in g:sonokai_lsp_kind_color
  execute "highlight! link CocSymbol" . kind[0] . " " . kind[1]
endfor
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
