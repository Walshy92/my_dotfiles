" Commands
command! -nargs=0 NvimuxTermPaste lua require('nvimux').term_only{cmd = 'normal pa'}
command! -nargs=0 NvimuxToggleTerm lua require('nvimux').term.toggle()
command! -nargs=1 NvimuxTermRename lua require('nvimux').term_only{cmd = 'file term://<args>'}
