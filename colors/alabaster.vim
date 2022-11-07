set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = "alabaster"

hi Normal ctermfg=248 guifg=#999999 ctermbg=black guibg=#000000

" Interface colors

hi LineNr ctermfg=237 guifg=#3A3A3A
hi! link SignColumn LineNr
hi! ColorColumn ctermbg=232 guibg=#080808

" Syntax highlighting

hi Comment ctermfg=167 guifg=#CC3333

hi Constant ctermfg=135 guifg=#9933FF
hi Number ctermfg=135 guifg=#9933FF
hi String ctermfg=39 guifg=#0099FF
hi Character ctermfg=44 guifg=#00CCCC
hi link Float Number
hi link Boolean Constant

hi Identifier ctermfg=248 guifg=#999999
hi link Function Identifier

hi Statement ctermfg=255 guifg=#EEEEEE
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement

hi PreProc ctermfg=61 guifg=#6B6B7F
hi link Include PreProc
hi link Define PreProc
hi link PreCondit PreProc

hi Type ctermfg=255 guifg=#EEEEEE
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

" Popup menus

hi Pmenu ctermfg=232 guifg=#080808 ctermbg=61 guibg=#6B6B7F
hi PmenuSel ctermfg=61 guifg=#6B6B7F ctermbg=232 guibg=#080808
hi PmenuSbar ctermbg=61 guibg=#6B6B7F
hi PmenuThumb ctermbg=248 guibg=#999999

" C/C++

hi cIncluded ctermfg=240 guifg=#575757

" Rust

hi link rustCommentLineDoc Comment
hi link rustCommentBlockDoc Comment

" Python

hi link pythonFunction Function
hi link pythonBuiltin Identifier
hi link pythonDecoratorName pythonDecorator

" Build systems

hi link cmakeCommand Keyword
hi link mesonBuiltin Keyword

" Doxygen

hi link doxygenSpecialMultilineDesc Comment
hi link doxygenBrief Comment
hi link doxygenBriefLine Comment
hi link doxygenComment Comment

" Operator highlighting

fun! s:HighlightOperators()
  syntax match alabaster_Special1 "?\|+\|-\|\*\|:\|<\|>\|&\||\|!\|\~\|\^\|%\|)\|(\|\.\|/\(/\|*\)\@!"
  syntax match alabaster_Special2 "\[\|\]\|{\|}\|,\|;"
  syntax match alabaster_Assign "=\|+=\|-=\|\*=\|\/=\|%=\|&&=\|||=\|\~=\|\^=\|&=\||="
  " Override comparison operators, since `=' is already highlighted
  syntax match alabaster_CompOverride "==\|!=\|>=\|<=\|<=>"
  syntax match alabaster_Glue "::"

  hi alabaster_Special1 ctermfg=37 guifg=#009999
  hi alabaster_Special2 ctermfg=34 guifg=#009900
  hi alabaster_Assign ctermfg=83 guifg=#66FF33
  hi alabaster_CompOverride ctermfg=37 guifg=#009999
  hi alabaster_Glue ctermfg=71 guifg=#669966
endfunction

augroup Alabaster
au Syntax * call s:HighlightOperators()
au ColorScheme * call s:HighlightOperators()
augroup END

