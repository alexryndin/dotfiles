inoremap {<cr> {}<esc>i<cr><esc>ko

"   m-key
noremap <leader>m= :RustFmt<cr>
noremap <leader>mg :LspDefinition<cr>
noremap <leader>mdd :LspDocumentDiagnostics<cr>
noremap <leader>mh :LspHover<cr>
noremap <leader>mc :LspCodeAction<cr>
noremap <leader>mr :LspRename<cr>

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
"
" :LspCodeAction 	Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
" :LspDeclaration 	Go to the declaration of the word under the cursor, and open in the current window
" :LspDefinition 	Go to the definition of the word under the cursor, and open in the current window
" :LspDocumentDiagnostics 	Get current document diagnostics information
" :LspDocumentFormat 	Format entire document
" :LspDocumentRangeFormat 	Format document selection
" :LspDocumentSymbol 	Show document symbols
" :LspHover 	Show hover information
" :LspImplementation 	Show implementation of interface in the current window
" :LspNextDiagnostic 	jump to next diagnostic (all of error, warning, information, hint)
" :LspNextError 	jump to next error
" :LspNextReference 	jump to next reference to the symbol under cursor
" :LspNextWarning 	jump to next warning
" :LspPeekDeclaration 	Go to the declaration of the word under the cursor, but open in preview window
" :LspPeekDefinition 	Go to the definition of the word under the cursor, but open in preview window
" :LspPeekImplementation 	Go to the implementation of an interface, but open in preview window
" :LspPeekTypeDefinition 	Go to the type definition of the word under the cursor, but open in preview window
" :LspPreviousDiagnostic 	jump to previous diagnostic (all of error, warning, information, hint)
" :LspPreviousError 	jump to previous error
" :LspPreviousReference 	jump to previous reference to the symbol under cursor
" :LspPreviousWarning 	jump to previous warning
" :LspReferences 	Find references
" :LspRename 	Rename symbol
" :LspStatus 	Show the status of the language server
" :LspTypeDefinition 	Go to the type definition of the word under the cursor, and open in the current window
" :LspTypeHierarchy 	View type hierarchy of the symbol under the cursor
" :LspWorkspaceSymbol 	Search/Show workspace symbol
