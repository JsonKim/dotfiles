call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'josegamez82/starrynight'
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'
Plug 'martinsione/darkplus.nvim'
Plug 'morhetz/gruvbox'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rescript-lang/vim-rescript'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

Plug 'bling/vim-airline'           " BUFFER navigator, status line 을 제공한다.

" Initialize plugin system
call plug#end()

" Theme
syntax enable
let g:codedark_italics = 1
colorscheme codedark
filetype plugin indent on " Put your non-Plugin stuff after this line

" set
set path+=**


set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
" set linebreak                     " break at word boundary
" set showbreak=++
set list listchars=tab:·\ ,trail:·,extends:>,precedes:< " https://johngrib.github.io/wiki/vim-with-space-char/
" set omnifunc=syntaxcomplete#Complete
" set mouse=a

set hidden  " Buffer should still exist if window is closed
set nopaste

set smartcase ignorecase hlsearch incsearch
"set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.

" 화면 표시
set nu               " 라인 넘버 출력
" set relativenumber
" set ruler            " 현재 커서 위치 (row, col) 좌표 출력, airline 설정시 필요 없는 듯
" set noerrorbells     " 에러 알림음 끄기
" set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
" set laststatus=2     " 상태바를 언제나 표시할 것, 무슨 역할인지 모르겠다.
set showmatch        " 일치하는 괄호 하이라이팅
" set cursorline       " highlight current line
set lazyredraw       " redraw only when we need to.
"set showcmd          " airline 플러그인과 충돌 가능성 있음.
"set nowrap
" set sidescroll=2 sidescrolloff=10
set wildmenu wildignorecase
set wildmode=full

" 짜증나는 swp, backup 파일 안 만들기
set noswapfile
set nobackup

" set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화

"사용
set bs=indent,eol,start  " backspace 키 사용 가능
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
"set noimd               " no imdisable 한글 입력기 관련인데 mac 에서는 안 통하는듯
set cindent autoindent smartindent
set history=200 undolevels=2000
" set cursorcolumn
" set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
set splitbelow
set splitright
" set virtualedit=block   " visual block mode를 쓸 때 문자가 없는 곳도 선택 가능하다
set autoread

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
    let s:vimDir = '$HOME/.vim'
    let &runtimepath.=','.s:vimDir
    let s:undoDir = expand(s:vimDir . '/undodir')

    call system('mkdir ' . s:vimDir)
    call system('mkdir ' . s:undoDir)

    let &undodir = s:undoDir
    set undofile
endif

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" map ----------------------------------------------------------------------
let mapleader = ","
" let maplocalleader = "\\"
" nnoremap <Leader>e :browse oldfiles<CR>

" 버퍼 관리
" nnoremap <M-T> :enew<CR>       " 새로운 버퍼를 연다
nnoremap <silent> <Leader>J     :bprevious!<CR>
nnoremap <silent> <Leader>K     :bnext!<CR>
" nnoremap <silent> <F9>d      :bd!<CR>
" 현재 버퍼를 닫고 이전 버퍼로 이동
" nnoremap <silent> <F9><F6>      :bp <BAR> bd #<CR>
" nnoremap <silent> <F9>q      :bp <BAR> bd #<CR>
" nnoremap <silent> <F9><F9>  :Buffers<CR>
" 현재 버퍼만 남기고 모두 닫기
" nnoremap <silent> <F9>o      :%bd <BAR> e # <BAR> bd #<CR>


" set-airline.vim
" vim-airline 설정
" @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
let g:airline#extensions#tabline#enabled = 1     " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t' " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer number 를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" set-fzf.vim
let g:fzf_launcher = "In_a_new_term_function %s"
imap <C-x><C-l> <plug>(fzf-complete-line)

nnoremap <f1>f :Files<CR>
nnoremap <f1>g :GitFiles<CR>
nnoremap <f1> <nop>
nnoremap <f1><f1> :Files<CR>
nnoremap <f1>a :Ag<CR>
nnoremap <f1>l :Lines<CR>
nnoremap <f1>` :Marks<CR>
nnoremap <f1>' :Marks<CR>
" nnoremap <f1>o :Locate getcwd()
nnoremap <f1>h :History<CR>
nnoremap <f1>c :History:<CR>
nnoremap <f1>/ :History/<CR>
nnoremap <f1>t :Tags ^<CR>
nnoremap <f1><f2> :Buffers<CR>
nnoremap <f3> :execute ":Tags " . expand('<cword>')<CR>

" nnoremap <f1>d :call fzf#vim#tags('^', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <f1>u call fzf#vim#ag('', {'options': '--select-2'})

" gem install coderay
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -' .&lines.'"'
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfunc

" set-coc.vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

