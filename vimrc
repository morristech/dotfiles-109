" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" Based on http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let need_to_install_plugins=0
if empty(system("grep lazy_load ~/.vim/bundle/vundle/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !rm -rf ~/.vim/bundle/vundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let need_to_install_plugins=1
endif

" Set runtime path to include Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        " vim package manager

" General Editing
Plugin 'SirVer/ultisnips'            " snippets
Plugin 'Valloric/YouCompleteMe'      " inline autocomplete
Plugin 'airblade/vim-gitgutter'      " git changes in gutter
Plugin 'ervandew/supertab'           " util for <tab> with snippets
Plugin 'godlygeek/tabular'           " text aligning
Plugin 'honza/vim-snippets'          " basic snippets to use with UltiSnips
Plugin 'scrooloose/nerdcommenter'    " easy code commenting
Plugin 'scrooloose/syntastic'        " automatic linting inside vim
Plugin 'skammer/vim-css-color'       " color hex colors in terminal
Plugin 'tpope/vim-endwise'           " autocomplete 'end's
Plugin 'tpope/vim-surround'          " change surrounding characters quickly
Plugin 'evansalter/vim-checklist'    " sweet markdown checklists
Plugin 'gcmt/taboo.vim'              " rename tabs for easier code navigation
Plugin 'ecomba/vim-ruby-refactoring' " faster ruby/rails refactoring
Plugin 'tpope/vim-bundler'           " wrapper for bundler
Plugin 'tpope/vim-rails'             " rails shortcuts
Plugin 'mattn/emmet-vim'             " faster html/JSX
Plugin 'wakatime/vim-wakatime'       " for tracking coding
Plugin 'flowtype/vim-flow'           " do flow syntax checking on save

" Themes
Plugin 'nanotech/jellybeans.vim'  " yummy
Plugin 'mhartington/oceanic-next' " ideal for React/ES6 development

" Airline
Plugin 'vim-airline/vim-airline'  " useful metadata and mode identifier

" Searching
Plugin 'ctrlpvim/ctrlp.vim'       " search file system
Plugin 'rking/ag.vim'             " integrate with silver searcher

" Navigation
Plugin 'scrooloose/nerdtree'      " file system bar

" Languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'           " better js highlighting
Plugin 'mxw/vim-jsx'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/csv.vim'
Plugin 'elzr/vim-json'
Plugin 'vim-perl/vim-perl'
Plugin 'kovisoft/slimv'            " Lisp development
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

if need_to_install_plugins == 1
  echo "Installing plugins via Vundle. Please ignore warnings afterwards."
  echo "This is a one-time operation that will take about a minute..."
  silent! PluginInstall
  echo "Done installing Vundle plugins!"
  q
endif

" ========================================================================
" General Stuff
" ========================================================================
syntax on
let mapleader = ','
scriptencoding utf-8

" Theme
syntax enable
colorscheme OceanicNext
set autoread                   " no prompt for file changes outside Vim
set background=dark
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backupdir=~/.tmp
set directory=~/.tmp           " don't clutter up dir with swp and tmp files
set expandtab                  " use soft tabs
set hidden                     " allow hidden, unsaved buffers
set history=750                " keep 750 lines of command line history
set hlsearch                   " highlight all search results
set incsearch                  " do incremental searching
set laststatus=2               " always display the status line
set laststatus=2               " always show statusline
set list                       " show whitespace
set listchars=trail:·          " whitespace character
set mouse=a                    " use mouse support in XTerm/iTerm.
set relativenumber
set number
set ruler                      " show cursor position at all times
set scrolloff=3                " scroll when the cursor is 3 lines from edge
set shiftwidth=2
set showcmd                    " display incomplete commands
set showmatch                  " show matching brackets
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'
set splitbelow                 " add new windows towards the bottom
set splitright                 " add new windows towards the right
set swapfile                   " keep swapfiles
set t_Co=256                   " terminal colors
set tabstop=2                  " tab settings
set textwidth=80               " line wrap at 80 characters for Ruby Convention
" set wildmode=list:longest      " bash-like tab completion
set wildmenu                   " zsh like tab completion
set wildmode=full              " ^
set nrformats=                 " treat all numbers as base 10

" Write all writeable buffers when changing buffers or losing focus.
set autowriteall                " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wa  " Save anytime we leave a buffer or MacVim loses focus.

" ========================================================================
" Plugin Settings
" ========================================================================
" Don't fold markdown
let g:vim_markdown_folding_disabled = 1

" Map ctrlP 'f' for 'find'
let g:ctrlp_map = '<leader>f'

" Pad comment delimeters with spaces
let NERDSpaceDelims = 1
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Use consistent theme for airline
let g:airline_theme='oceanicnext'

" Allow jsx syntax highlighting with .js extensions
let g:jsx_ext_required=0

" Turn on syntax highlighting for ruby operators (==, ||, &&, etc)
let ruby_operators=1

" Recommended by gitgutter
set updatetime=250

" Syntastic settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_jsx_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '`npm bin`/eslint'
let g:syntastic_jsx_eslint_exec = '`npm bin`/eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"

" Vim Checklist
let g:checklist_filetypes = ['txt', 'md', 'markdown', 'text']

" Emmet configuration
let g:user_emmet_leader_key='<C-A>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" If this is set to 1, the |quickfix| window opened when the plugin finds an error will close automatically.
let g:flow#autoclose=1

" Vim Go Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ========================================================================
" Searching
" ========================================================================
" Use Silver Searcher instead of grep - brew install the_silver_searcher
set wildignore+=tmp/**                " Ignore stuff that can't be opened

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " Without --hidden, it never finds .travis.yml since it starts with a dot
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " https://github.com/kien/ctrlp.vim/issues/174
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

" ========================================================================
" Key mappings
" ========================================================================
" Re-source my vimrc
map <Leader>sv :so $MYVIMRC<cr>

" Install Vundle Plugins
map <Leader>pi :PluginInstall<cr>

" Edit <useful files>
map <leader>ev :vsplit $MYVIMRC<cr>
map <leader>ea :vsplit ~/.dotfiles/aliases<cr>
map <leader>et :vsplit ~/Dropbox/docs/todos.md<cr>
map <leader>eb :vsplit ~/Dropbox/docs/bug-journal.md<cr>
map <leader>ep :vsplit ~/Dropbox/docs/athena.md<cr>
map <leader>ew :vsplit ~/Dropbox/docs/writing.md<cr>
map <leader>eb :vsplit ~/Dropbox/docs/blog-posts.md<cr>
map <leader>edj :vsplit ~/Dropbox/docs/dream-journal.md<cr>
map <leader>eg :vsplit ~/Dropbox/docs/goals.md<cr>
map <leader>ek :vsplit ~/Dropbox/docs/kira.rb<cr>
map <leader>en :vsplit ~/Dropbox/docs/notes.md<cr>
map <leader>er :vsplit ~/Dropbox/docs/reading-notes.md<cr>
map <leader>es :UltiSnipsEdit<cr>

" Rename vim tabs quickly
map <leader>tr :TabooRename

" open tabs with command-<tab number>
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

" Checklists
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>

" File tree browser
map \ :NERDTreeToggle<cr>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<cr>

" Easy access to the shell
map <Leader><Leader> :!

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<cr>""
nnoremap <Space><Space> <c-^>

" Align by text by = or :
nmap <Leader>a= :Tabularize /=<cr>
vmap <Leader>a= :Tabularize /=<cr>
nmap <Leader>a: :Tabularize /:\zs<cr>
vmap <Leader>a: :Tabularize /:\zs<cr>
vmap <Leader>af :Tabularize /from<cr>

" Automatically align text when in insert mode - http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Quicker window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Substitution
nmap <Leader>s  :%s/

" Alphabetically Sort
vmap <Leader>as :sort<cr>
nmap <Leader>as :sort<cr>

" Commenting
map <Leader>/ <plug>NERDCommenterToggle

" Tab Movement
nnoremap <leader>j :tabnext<cr>
nnoremap <leader>k :tabprevious<cr>

" Auto indent the whole file
nmap <leader>=  gg=G``

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Better command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" window splitting mappings
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" Rails
nmap <leader>b :BundleInstall<CR>
nmap <leader>et :AV<CR>

" Go Vim Mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" ========================================================================
" Abbreviations
" ========================================================================
iab @@ spencercdixon@gmail.com
iab adn and
iab que queue
iab teh the
iab req request
iab res response
iab iv I've
iab il I'll
iab monday Monday
iab tuesday Tuesday
iab wednesday Wednesday
iab thursday Thursday
iab friday Friday
iab saturday Saturday
iab sunday Sunday

" ========================================================================
" Autocommands
" ========================================================================
augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" convert md to markdown for syntax highlighting
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md,*.md setf markdown
au BufNewFile,BufRead *.styles setf css

" convert CSS file types
au BufNewFile,BufRead *.styles setf css

" convert Perl file types
au BufNewFile,BufRead *.t,*.pl,*.pm setf perl

" ========================================================================
" Custom Functions
" ========================================================================
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
