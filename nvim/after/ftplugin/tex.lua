-- I cannot figure out how to do this the "lua" way
vim.cmd("setlocal spell spelllang=en_us")

-- https://castel.dev/post/lecture-notes-1/ Goes to the previous spelling mistake and fixes it
vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", {noremap = true})

-- Messes with the formatting of the spelling mistakes
vim.cmd("hi clear SpellBad")
vim.cmd("hi SpellBad cterm=underline,bold ctermfg=red")
vim.cmd("hi clear SpellCap")
vim.cmd("hi SpellCap cterm=underline,bold ctermfg=green")
vim.cmd("hi clear SpellRare")
vim.cmd("hi SpellRare cterm=underline,bold ctermfg=blue")
vim.cmd("hi clear SpellLocal")
vim.cmd("hi SpellLocal cterm=underline,bold ctermfg=red")
