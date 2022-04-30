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

syn keyword cxTodo contained TODO FIXME XXX


setlocal iskeyword=!,@-@,$,+,.,-,*,/,\<,\>,=,A-Z,a-z

" Direct operators
syn keyword cxOperators + - * / mod abs min max
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
syn keyword cxCompilerEnd @.

" Object Theory statements
syn keyword cxOTWords   yl ya yu yp

" Symbol reference and shorthands
syn match cxName contained '[-_a-zA-Z0-9]+'

syn match cxCall '\([-_a-zA-Z0-9]+\)' contains=cxName
syn match cxCompCall '[@]\([-_a-zA-Z0-9]+\)' contains=cxName
syn match cxRef '\[[-_a-zA-Z0-9]+\]'

" Miscellaneous
syn match cxInteger '-[0-9]+'
syn match cxInteger '[0-9]+'
syn match cxChar '\'.\''

syn match cxComment '#.*$' contains=cxTodo

syn region cxString start=+\"+ end=+\"+


" Highlight colors
hi def link cxTodo      Todo
hi def link cxOperators Operator
hi def link cxStack     Special
hi def link cxCond      Conditional
hi def link cxInteger   Number
hi def link cxComment   Comment
hi def link cxString    String
hi def link cxCompiler  PreProc
hi def link cxCompilerEnd   Identifier
hi def link cxInOut     Statement
hi def link cxOTWords   Statement
hi def link cxChar      Character
hi def link cxName      String
hi def link cxCall      Identifier
hi def link cxCompCall  cxCompiler
hi def link cxRef       Statement

let b:current_syntax = "codex"

let &cpo = s:cpo_save
unlet s:cpo_save
