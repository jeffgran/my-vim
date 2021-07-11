set termguicolors
set mouse=a
set splitbelow
set splitright 
set number
set relativenumber
augroup numbertoggle
  autocmd!
augroup END
set hidden



" Plug 'kassio/neoterm'

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdTree'

" fuzzy file/command/etc finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" buffer switching
Plug 'mihaifm/bufstop'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" colors
Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

:lua require('jgtelescope');

let mapleader = ","
nnoremap ; :
vnoremap ; :


nnoremap <C-t> :NERDTreeToggle<CR>

" escape to exit terminal-mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-g> <C-\><C-n>
inoremap <C-g> <Esc>
tnoremap <C-g> <Esc>
cnoremap <C-g> <Esc>
nnoremap <C-g> <Esc>
vnoremap <C-g> <Esc>
onoremap <C-g> <Esc>
noremap <C-g> <Esc>




" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l



" files / buffers / fuzzy finding
nnoremap <C-o> :Telescope file_browser hidden=true<CR>
nnoremap <Leader>oo :Telescope find_files<CR>
nnoremap <C-w> :bd<CR> " close buffer
tnoremap <C-w> :bd<CR> " close buffer

nnoremap <C-b> :Telescope buffers<CR>
nnoremap <C-r> :Telescope command_history<CR>

nnoremap <Leader>s :terminal<CR>


nnoremap <Leader>gg :Git<CR>
tnoremap <Leader>gg :Git<CR>

nnoremap <C-s> :w<CR>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>

augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
  autocmd FileType lua              let b:comment_leader = '-- '
augroup END
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Allows writing to files with root priviledges
cmap w!! w !sudo tee %


" Theme
syntax enable
" colorscheme OceanicNext
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE
" hi SignColumn guibg=NONE ctermbg=NONE
" hi EndOfBuffer guibg=NONE ctermbg=NONE



function! ClearTerminal()
  set scrollback=1
  let &g:scrollback=1
  echo &scrollback
  call feedkeys("\i")
  call feedkeys("clear\<CR>")
  call feedkeys("\<C-\>\<C-n>")
"   call feedkeys("\i")
  sleep 100m
  let &scrollback=10000
endfunction

nnoremap <C-k> :call ClearTerminal()<CR>
