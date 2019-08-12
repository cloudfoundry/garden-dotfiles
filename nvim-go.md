# Neovim Cheatsheet for Go

This cheatsheet is particularly focussed on differences introduced in the new configuration using [coc.nvim](https://github.com/neoclide/coc.nvim).

##

Mode | Key combination | Effect
--- | --- | ---
Insert | some characters | Activate completion. When packages are completed, they are added to the imports.
Insert | \<tab> | Navigate the completion list. Entries provided by the language server have [LS] on the right.
Insert | shift-\<tab> | Navigate the completion list backwards.
Insert | \<CR> | Accept the highlighted completion.
Normal | gd | Go to definition of the Go term beneath the cursor.
Normal | K | Show documentation for the Go term beneath the cursor. Useful for variables as well as functions, including type information for variables assigned by functions.
Normal | gr | Show code references to the Go term beneath the cursor. If there is a single reference, it will be opened. If many, a list with a preview pane will be opened. Use `j` and `k` to navigate it.
Normal | gy | Jump to the type definition of the Go term beneath the cursor.
Normal | gi | Show Go objects implementing the interface beneath the cursor.
Normal | ,rn | Rename Go identifier beneath the cursor throughout the project.
Normal | \<space> a | View list of problems in the current Go project.
Normal | [c | Jump to previous error
Normal | ]c | Jump to next error
Normal | ,qf | Apply a fix to the current line, if the language server can help
Normal | ,ac | Apply a 'code action' to the current line. Choose from the actions offered, if any.
Normal | \<space> e | List installed CoC.nvim extensions
Command | :CocInstall ... | Install a [Coc.nvim extension](https://github.com/neoclide/coc.nvim#extensions)
Command | :CocUninstall ... | Uninstall an extension
