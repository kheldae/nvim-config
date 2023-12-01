" Vim syntax file
" Language:     Rune Codex assembly
" Current Maintainer:   Karim Vergnes <me@thesola.io>
" Filenames:    *.cx

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync ccomment
syn sync maxlines=200

syn keyword cxTodo contained TODO FIXME XXX NOTE


setlocal iskeyword=!,?,@-@,$,:,+,.,-,*,/,\<,\>,=,48-57,A-Z,a-z

" Direct operators
syn keyword cxOperators mod abs min max + - * /
syn keyword cxOperators and or xor not lsh rsh invert
syn keyword cxOperators 0< 0<= 0<> 0= 0> 0>= < <= <> = > >=

" Stack operations
syn keyword cxStack pop dup swap lrot rrot

" Conditionals
syn keyword cxCond  if else then call

" Input-Output statements
syn keyword cxInOut in out

" Compiler statements
syn keyword cxCompiler  @lock @fun @seg @use @put
syn keyword cxCompiler  @if @else
syn keyword cxCompilerCheckpoint @:diff @:stat
syn keyword cxCompilerEnd @.

" Object Theory statements
syn keyword cxOTWords   yl ya yu yp

" Type assert statements
syn keyword cxTypeCheck fun? seg? cseg? yseg? ym? R?
syn keyword cxTypeCheck u8? u16? u32? u64? i8? i16? i32? i64? f32? f64? unr?

" Type cast statements
syn keyword cxTypeCast  u8! u16! u32! u64! i8! i16! i32! i64! f32! f64!

" Symbol reference and shorthands
syn match cxName contained '[_a-zA-Z][-_a-zA-Z0-9]*'

syn match cxCall '\([-_a-zA-Z0-9]+\)' contains=cxName
syn match cxCompCall '[@]\([-_a-zA-Z0-9]+\)' contains=cxName
syn match cxRef '\[[-_a-zA-Z0-9]+\]'

" Miscellaneous
syn match cxInteger '-[0-9]+'
syn match cxInteger '[0-9]+'
syn match cxFloat '[0-9]*\.[0-9]+'
syn match cxFloat '[0-9]+\.[0-9]*'
syn match cxFloat '-[0-9]*\.[0-9]+'
syn match cxFloat '-[0-9]+\.[0-9]*'
syn match cxChar '\'.\''

syn match cxComment '#.*$' contains=cxTodo

syn region cxString start=+\"+ end=+\"+


" Highlight colors
hi def link cxTodo          Todo
hi def link cxOperators     Operator
hi def link cxStack         Special
hi def link cxCond          Conditional
hi def link cxInteger       Number
hi def link cxComment       Comment
hi def link cxString        String
hi def link cxCompiler      PreProc
hi def link cxCompilerCheckpoint Tag
hi def link cxCompilerEnd   Identifier
hi def link cxInOut         Statement
hi def link cxOTWords       Statement
hi def link cxChar          Character
hi def link cxName          String
hi def link cxCall          Identifier
hi def link cxCompCall      cxCompiler
hi def link cxRef           Statement
hi def link cxTypeCast      Question
hi def link cxTypeCheck     Question

let b:current_syntax = "codex"

let &cpo = s:cpo_save
unlet s:cpo_save
