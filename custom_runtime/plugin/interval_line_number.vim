if exists('g:loaded_interval_line_number') || !has('nvim-0.3.2')
    finish
endif
let g:loaded_interval_line_number = 1

if !exists('g:interval_line_number')
    let g:interval_line_number = 10
endif

if !exists('g:interval_line_number#use_custom')
    let g:interval_line_number#use_custom = 0
endif

if get(g:, 'interval_line_number_enable_at_startup', 0)
    call interval_line_number#enable()
elseif get(g:, 'interval_line_number#enable_at_startup', 0)
    call interval_line_number#enable()
endif

command! LineNumberIntervalEnable call interval_line_number#enable()
command! LineNumberIntervalDisable call interval_line_number#disable()
command! LineNumberIntervalToggle call interval_line_number#toggle()
