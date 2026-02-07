if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'NvimTree') ==# -1
    call add(g:sonokai_loaded_file_types, 'NvimTree')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: NvimTree {{{
" https://github.com/kyazdani42/nvim-tree.lua
if !s:configuration.transparent_background
  call sonokai#highlight('NvimTreeNormal', s:palette.fg, s:palette.bg_dim)
  call sonokai#highlight('NvimTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call sonokai#highlight('NvimTreeVertSplit', s:palette.bg0, s:palette.bg0)
  call sonokai#highlight('NvimTreeCursorLine', s:palette.none, s:palette.bg0)
endif
highlight! link NvimTreeSymlink Fg
highlight! link NvimTreeFolderName Green
highlight! link NvimTreeRootFolder Grey
highlight! link NvimTreeFolderIcon Blue
highlight! link NvimTreeEmptyFolderName Green
highlight! link NvimTreeOpenedFolderName Green
highlight! link NvimTreeExecFile Fg
highlight! link NvimTreeOpenedHL Fg
highlight! link NvimTreeSpecialFile Fg
highlight! link NvimTreeImageFile Fg
highlight! link NvimTreeIndentMarker Grey
highlight! link NvimTreeGitDirtyIcon Yellow
highlight! link NvimTreeGitStagedIcon Blue
highlight! link NvimTreeGitMergeIcon Orange
highlight! link NvimTreeGitRenamedIcon Purple
highlight! link NvimTreeGitNewIcon Green
highlight! link NvimTreeGitDeletedIcon Red
highlight! link NvimTreeLspDiagnosticsError RedSign
highlight! link NvimTreeLspDiagnosticsWarning YellowSign
highlight! link NvimTreeLspDiagnosticsInformation BlueSign
highlight! link NvimTreeLspDiagnosticsHint PurpleSign
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
