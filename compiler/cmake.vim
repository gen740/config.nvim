if exists("current_compiler")
  finish
endif
let current_compiler = "cmake"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
            \CMake\ Error\ at\ %f:%l:

let &cpo = s:cpo_save
unlet s:cpo_save
