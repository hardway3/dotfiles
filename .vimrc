let g:airline_powerline_fonts = 1
scriptencoding utf-8
set encoding=UTF-8
" VIM-PLUG {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p "$HOME/.vim/autoload"
  silent !curl -fLo "$HOME/.vim/autoload/plug.vim" 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


"let g:powerline_pycmd = 'py3'
"let g:airline#extensions#tabline#enabled = 1
nmap  <F8> : TagbarToggle <CR>
set enc=utf-8
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" PlugRemotePlugins(info) {{{
if has('nvim')
  let s:remote_plugins_updated = 0
  function! PlugRemotePlugins(info) abort
    if !s:remote_plugins_updated
      let s:remote_plugins_updated = 1
      UpdateRemotePlugins
    endif
  endfunction
else
  function! PlugRemotePlugins(info) abort
  endfunction
endif
" }}}
set guifont=Monoid\ Nerd\ Font\ 9
" PlugCoc(info) {{{
function! PlugCoc(info) abort
  if a:info.status ==? 'installed' || a:info.force
    !yarn install
    if exists('s:coc_extensions')
      call call('coc#add_extension', s:coc_extensions)
    endif
  elseif a:info.status ==? 'updated'
    !yarn install
    call coc#util#update()
  endif
  call PlugRemotePlugins(a:info)
endfunction
" }}}
call plug#begin('~/.vim/plugged')
" Prelude {{{
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')
if !has('nvim')
  set pyx=3
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" }}}
" ColorScheme {{{
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'
" }}}
" Highlighting {{{
"Plug 'junegunn/limelight.vim'
"Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'guns/xterm-color-table.vim'
"Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'whatyouhide/vim-lengthmatters'
Plug 'oblitum/vim-operator-highlight'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"Plug 'Valloric/MatchTagAlways', {'for': 'html'}
" }}}

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" UI {{{
"Plug 'szw/vim-maximizer'
Plug 'itchyny/lightline.vim'
"Plug 'pgdouyon/vim-evanesco'
"Plug 'terryma/vim-expand-region'
"Plug 'oblitum/vim-tmux-navigator'
"Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
"Plug 'oblitum/goyo.vim', {'branch': 'custom-groups'}
Plug 'ryanoasis/vim-devicons', {'do': function('PlugRemotePlugins')}
Plug 'kristijanhusak/defx-icons', {'do': function('PlugRemotePlugins')}
" }}}
" Editing {{{
"Plug 'Raimondi/yaifa'
"Plug 'mattn/emmet-vim'
"Plug 'tpope/vim-ragtag'
"Plug 'tpope/vim-repeat'
"Plug 'godlygeek/tabular'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-unimpaired'
"Plug 'chaoren/vim-wordmotion'
"Plug 'dietsche/vim-lastplace'
" }}}
" Navigation {{{
"Plug 'wincent/ferret'
Plug 'majutsushi/tagbar'
"Plug 'simnalamburt/vim-mundo'
Plug 'Shougo/defx.nvim', {'do': function('PlugRemotePlugins')}
"Plug 'Shougo/neomru.vim', {'do': function('PlugRemotePlugins')}
"Plug 'Shougo/denite.nvim', {'do': function('PlugRemotePlugins')}
"Plug 'neoclide/denite-extra', {'do': function('PlugRemotePlugins')}
" }}}
" Project Structure {{{
"Plug 'tpope/vim-obsession'
"Plug 'embear/vim-localvimrc'
"Plug 'editorconfig/editorconfig-vim'
" }}}
" Source Control {{{
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'whiteinge/diffconflicts'
"Plug 'chrisbra/vim-diff-enhanced'
" }}}
" System Tools {{{
"Plug 'tpope/vim-eunuch'
"Plug 'Shougo/vimproc', {'do': 'make'}
" }}}
" Code Evaluation {{{
"Plug 'nicwest/QQ.vim'
"Plug 'rhysd/wandbox-vim'
"Plug 'jpalardy/vim-slime'
"Plug 'tpope/vim-dispatch'
"Plug 'metakirby5/codi.vim'
"Plug 'thinca/vim-quickrun'
" }}}
" Debugging {{{
"Plug 'gilligan/vim-lldb'
"Plug 'idanarye/vim-vebugger'
" }}}
" Exporting {{{
"Plug 'mattn/gist-vim'
"Plug 'mattn/webapi-vim'
"Plug 'basyura/bitly.vim'
"Plug 'oblitum/frawor', {'on': []}
"Plug 'oblitum/formatvim', {'on': []}
" }}}
" Documentation {{{
"Plug 'KabbAmine/zeavim.vim'
" }}}
" Snippets {{{
Plug 'SirVer/ultisnips', {'do': function('PlugRemotePlugins')}
Plug 'honza/vim-snippets'
" }}}

Plug 'vim-scripts/SingleCompile'
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

Plug 'scrooloose/nerdtree'
"Plug 'Lokaltog/powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'


set t_Co=16


" Diagnostics {{{
Plug 'w0rp/ale'
let s:coc_extensions = [
\   'coc-css',
\   'coc-rls',
\   'coc-html',
\   'coc-json',
\   'coc-pyls',
\   'coc-yaml',
\   'coc-emmet',
\   'coc-emoji',
\   'coc-vetur',
\   'coc-eslint',
\   'coc-vimtex',
\   'coc-prettier',
\   'coc-tsserver',
\   'coc-ultisnips'
\ ]
"Plug 'neoclide/coc-neco'
"Plug 'neoclide/coc-denite'
Plug 'neoclide/coc.nvim', {'do': function('PlugCoc')}

" }}}
" FileType {{{
" JSON {{{
Plug 'elzr/vim-json'
" }}}
" QMake {{{
Plug 'suy/vim-qmake'
" }}}
" Vue {{{
"Plug 'posva/vim-vue'
" }}}
" Binary {{{
"Plug 'fidian/hexmode'
" }}}
" Haml {{{
"Plug 'tpope/vim-haml'
" }}}
" Swift {{{
"Plug 'keith/swift.vim'
" }}}
" TOML {{{
"Plug 'cespare/vim-toml'
" }}}
" ATS {{{
"Plug 'bakpakin/ats2.vim'
" }}}
" QML {{{
Plug 'peterhoeg/vim-qml'
" }}}
" Ruby {{{
"Plug 'vim-ruby/vim-ruby'
" }}}
" PGP {{{
Plug 'jamessan/vim-gnupg'
" }}}
" Rust {{{
"Plug 'rust-lang/rust.vim'
" }}}
" cJSON {{{
"Plug 'neoclide/jsonc.vim'
" }}}
" GLSL {{{
"Plug 'tikhomirov/vim-glsl'
" }}}
" LESS {{{
"Plug 'groenewege/vim-less'
" }}}
" Spacebars {{{
Plug 'Slava/vim-spacebars'
" }}}
" AppleScript {{{
"Plug 'mityu/vim-applescript'
" }}}
" CSS {{{
"Plug 'hail2u/vim-css3-syntax'
" }}}
" i3 {{{
Plug 'mboughaba/i3config.vim'
" }}}
" Idris {{{
"Plug 'idris-hackers/idris-vim'
" }}}
" JavaScript {{{
"Plug 'chemzqm/vim-jsx-improve'
" }}}
" TypeScript {{{
"Plug 'leafgarland/typescript-vim'
" }}}
" Neo4j's Cypher {{{
"Plug 'jjaderberg/vim-syntax-cypher'
" }}}
" Pandoc {{{
"Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}
" Haskell {{{
"Plug 'neovimhaskell/haskell-vim'
"Plug 'enomsg/vim-haskellConcealPlus'
" }}}
" Reason {{{
"Plug 'reasonml-editor/vim-reason-plus'
" }}}
" C++ {{{
Plug 'vim-jp/cpp-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" }}}
" Python {{{
if !has('nvim')
  Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
endif
" }}}
" LaTeX {{{
"Plug 'lervag/vimtex', {'do': function('PlugRemotePlugins')}
" }}}
" VimL {{{
"Plug 'Shougo/neco-vim', {'do': function('PlugRemotePlugins')}
" }}}
" Go {{{
"Plug 'fatih/vim-go', {'tag': '*', 'do': function('PlugRemotePlugins')}
" }}}
" }}}
" Speech {{{
"Plug 'phongvcao/vim-stardict'
"Plug 'echuraev/translate-shell.vim'
"Plug 'rhysd/vim-grammarous', {'do': function('PlugRemotePlugins')}
" }}}
" Writting {{{
"Plug 'reedes/vim-pencil'
"Plug 'junegunn/vim-journal'
" }}}
call plug#end()
" }}}
" Settings {{{
set t_ut=                     " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
set nowrap                    " don't wrap lines
set hidden                    " hide buffer without notice
set mouse=a                   " enable mouse
set autoread                  " auto read external file changes
set hlsearch                  " highlight the last searched term
set noshowcmd                 " disable blinking command feedback in bottom-right corner
set guicursor=                " disable cursor shape
set noshowmode                " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noswapfile                " no swap files
set cpoptions+=$              " dollar sign while changing
set pumheight=30              " limit popup menu height
set shortmess+=c              " disable ins-completion-menu 'match 1 of N' messages
set synmaxcol=250             " set max syntax highlighting column to sane level
set conceallevel=2            " hides concealed text
set updatetime=300            " set updatetime to shorter value
set virtualedit=all           " let us walk in limbo
set visualbell t_vb=          " no visual bell
set spelllang=en,pt_br        " set default spelling languages
set completeopt-=preview      " disable the preview window
set clipboard=unnamedplus     " for simplified clipboard copy/paste
set expandtab shiftwidth=4    " space for tabs by default
set tabstop=4 softtabstop=4

let mapleader = ' '

augroup vimrc | autocmd! | augroup end

" Open QuickFix horizontally with line wrap
autocmd vimrc FileType qf wincmd J | setlocal wrap

" Preview window with line wrap
autocmd vimrc WinEnter * if &previewwindow | setlocal wrap | endif
" }}}
" GUI {{{
if has('gui_running')
  set guifont=Monoid\ Nerd\ Font\ 9

  " Remove scroll bars
  set guioptions-=L
  set guioptions-=R
  set guioptions-=l
  set guioptions-=r

  " Disable toolbar
  set guioptions=-t

  " Initial window dimensions
  set lines=47 columns=80
endif
" }}}
" Util {{{
" s:guicolors()                        | check if using guicolors {{{
function! s:guicolors() abort
  return has('gui_running') || has('termguicolors') && &termguicolors
endfunction
" }}}
" s:set_guicolors()                    | set guicolors if available {{{
function! s:set_guicolors() abort
  if has('termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endfunction
" }}}
" s:attr(group, attr, ...)             | get group attribute {{{
function! s:attr(group, attr, ...) abort
  call assert_inrange(0, 1, a:0)
  if a:0 > 0
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr, a:1)
  else
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr)
  endif
  return empty(a) || a ==# '-1' ? 'NONE' :  a
endfunction
" }}}
" s:hi(g, gf, gb, ctf, ctb)            | highlighting helper {{{
function! s:hi(group, guifg, guibg, ctermfg, ctermbg) abort
  exec printf('hi %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s',
       \      a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg)
endfunction
" }}}
" s:fg(group, mode)                    | get foreground of highlighting group {{{
function! s:fg(group, mode) abort
  return s:attr(a:group, s:attr(a:group, 'reverse', a:mode) ? 'bg' : 'fg', a:mode)
endfunction
" }}}
" s:bg(group, mode)                    | get background of highlighting group {{{
function! s:bg(group, mode) abort
  return s:attr(a:group, s:attr(a:group, 'reverse', a:mode) ? 'fg' : 'bg', a:mode)
endfunction
" }}}
" s:export(group)                      | export highlighting group {{{
function! s:export(group) abort
  return {
  \   'fg': s:attr(a:group, 'fg'),
  \   'bg': s:attr(a:group, 'bg'),
  \   'gui': {
  \     'fg': s:attr(a:group, 'fg', 'gui'),
  \     'bg': s:attr(a:group, 'bg', 'gui')
  \   },
  \   'cterm': {
  \     'fg': s:attr(a:group, 'fg', 'cterm'),
  \     'bg': s:attr(a:group, 'bg', 'cterm')
  \   }
  \ }
endfunction
" }}}
" s:backup(groups)                     | generate highlighting backup from redir {{{
function! s:backup(groups) abort
  let backup = ''
  silent! exec 'redir => backup | ' .
          \    join(map(copy(a:groups), '"hi " . v:val'), ' | ') .
          \    ' | redir end'
  return backup
endfunction
" }}}
" s:restore(backup)                    | restore highlighting from redir {{{
function! s:restore(backup) abort
  let hls = map(split(a:backup, '\v\n(\S)@='),
            \         {_, v -> substitute(v, '\v\C(<xxx>|\s|\n)+', ' ', 'g')})
  for hl in hls
    let chunks = split(hl)
    let group = chunks[0]
    let tail = join(chunks[1:])
    exec 'hi clear ' . group
    if tail !=# 'cleared'
      let attrs = split(tail, '\v\c(<links\s+to\s+)@=')
      for attr in attrs
        if attr =~? '\v\c^links\s+to\s+'
          exec printf('hi! link %s %s', group,
               \      substitute(attr, '\v\c^links\s+to\s+', '', ''))
        else
          exec printf('hi %s %s', group, attr)
        endif
      endfor
    endif
  endfor
endfunction
" }}}
" s:rgba(hexcode, alpha)               | convert hexcode to rgba {{{
function! s:rgba(hexcode, alpha) abort
  call assert_match('^\v#\x{6}$', a:hexcode)
  return printf('rgba(%s, %s, %s, %s)',
         \      str2nr(a:hexcode[1:2], 16),
         \      str2nr(a:hexcode[3:4], 16),
         \      str2nr(a:hexcode[5:6], 16),
         \      a:alpha)
endfunction
" }}}
" s:color_distance(hexcode1, hexcode2) | calculate color distance {{{
function! s:color_distance(hexcode1, hexcode2) abort
  call assert_match('^\v#\x{6}$', a:hexcode1)
  call assert_match('^\v#\x{6}$', a:hexcode2)
  let dr = str2nr(a:hexcode1[1:2], 16) - str2nr(a:hexcode2[1:2], 16)
  let dg = str2nr(a:hexcode1[3:4], 16) - str2nr(a:hexcode2[3:4], 16)
  let db = str2nr(a:hexcode1[5:6], 16) - str2nr(a:hexcode2[5:6], 16)
  return dr*dr + dg*dg + db*db
endfunction
" }}}
" s:farthest_color(hexcode, hexcodes)  | return index of farthest color {{{
function! s:farthest_color(hexcode, hexcodes) abort
  let c = -1
  let i = 0
  let d = 0
  for hc in a:hexcodes
    let cd = s:color_distance(a:hexcode, hc)
    if cd > d
      let c = i
      let d = cd
    endif
    let i += 1
  endfor
  return c
endfunction
" }}}
" }}}
" ColorScheme {{{
call s:set_guicolors()

silent! colors deep-space
"let g:gruvbox_contrast_light = 'hard'
"let g:gruvbox_contrast_dark = 'hard'
"silent! colors gruvbox

" Patches {{{
function! s:backup_prior_patches() abort
  if get(g:, 'colors_name', '') != get(g:, 'last_colors_name', '')
    let g:last_colors_name = get(g:, 'colors_name', '')
    let g:color_backup_normal = s:export('Normal')
    let g:color_backup = s:backup(['Normal', 'NonText'])
  endif
endfunction

function! s:apply_colorscheme_patches() abort
  hi! link Conceal Normal
  hi! link EndOfBuffer NonText
  if !has('gui_running')
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
  endif
  if exists('g:loaded_lightline')
    call s:hi('SignColumn',
         \    'NONE', g:lightline#palette().normal.middle[0][1],
         \    'NONE', g:lightline#palette().normal.middle[0][3])
  endif
  hi! link LineNr SignColumn
endfunction

autocmd vimrc VimEnter *
\   if !exists('g:color_backup')
\|    call s:backup_prior_patches() | call s:apply_colorscheme_patches()
\|  endif
autocmd vimrc ColorScheme * call s:backup_prior_patches() | call s:apply_colorscheme_patches()
" }}}
" }}}
" FileType {{{
" VimL {{{
autocmd vimrc FileType vim setlocal foldmethod=marker
" }}}
" C++ {{{
autocmd vimrc BufNewFile,BufRead *
\   if expand('%:e') =~? '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$'
\|    if &ft !=# 'cpp'
\|      set ft=cpp
\|    endif
\|  endif
autocmd vimrc FileType cpp setlocal cinoptions+=L0 " disable automatic label dedent
" }}}
" Rust {{{
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
" }}}
" Go {{{
let g:godef_split = 0
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'
autocmd vimrc FileType go setlocal noexpandtab
" }}}
" Ruby {{{
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
" }}}
" OCaml {{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
if !empty(g:opamshare) && g:opamshare !~? 'not found'
  exec 'set rtp+=' . g:opamshare . '/merlin/vim'
  exec 'set rtp+=' . g:opamshare . '/ocp-indent/vim'
endif
" }}}
" CSS {{{
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup end
" }}}
" Mail {{{
autocmd vimrc FileType mail
\   if expand('%:p') =~# '^/tmp/mutt/\(neo\)\?mutt-'
\|    set ft=pandoc
\|  else
\|    setlocal spell
\|  endif
" }}}
" Markdown {{{
autocmd vimrc FileType markdown setlocal spell
" }}}
" Mmark {{{
autocmd vimrc BufNewFile,BufRead *.mmark set ft=pandoc
" }}}
" Pandoc {{{
autocmd vimrc FileType pandoc setlocal spell
" }}}
" LaTeX {{{
let g:vimtex_quickfix_mode = 0
" }}}
" Git {{{
autocmd vimrc FileType gitcommit setlocal spell
" }}}
" i3 {{{
autocmd vimrc BufNewFile,BufRead ~/.config/i3/config set ft=i3config
" }}}
" }}}
" Plugin {{{
" Highlighting
" vim-lengthmatters {{{
let g:lengthmatters_excluded = [
\   'vim-plug', 'denite', 'tagbar', 'Mundo.*', 'defx', 'quickrun', 'codi', 'trans',
\   '', 'zsh', 'html', 'javascript', 'json', 'css', 'scss', 'latex',
\   'haskell', 'purescript', 'elm', 'java',
\   'mailcap', 'muttrc',
\   'git', '.*debug.*'
\ ]
autocmd vimrc VimEnter,ColorScheme *
\   if exists('g:loaded_lightline') && exists('g:loaded_lengthmatters')
\|    call lengthmatters#highlight(
\       printf('guibg=%s ctermbg=%d',
\          g:lightline#palette().normal.middle[0][1],
\          g:lightline#palette().normal.middle[0][3]))
\|  endif
" }}}
" vim-operator-highlight {{{
let g:ophigh_highlight_link_group = 'Keyword'
" }}}
" vim-better-whitespace {{{
let g:better_whitespace_filetypes_blacklist = [
\   'diff', 'gitcommit', 'qf', 'help', 'vim-plug', 'denite', 'tagbar',
\   'Mundo', 'MundoDiff', 'defx', 'quickrun', 'codi', 'mail', 'muttrc'
\ ]
let g:better_whitespace_operator = ''
" }}}
" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 0
" }}}
" UI
" lightline.vim {{{
let g:lightline = {'colorscheme': 'deepspace'}
"let g:lightline = {'colorscheme': 'gruvbox'}
let g:lightline.active = {
\   'left' : [
\     ['mode', 'paste'],
\     ['fugitive'],
\     ['filepath', 'filename_active', 'current_tag']
\   ],
\   'right': [
\     ['lineinfo', 'coc_error', 'coc_warning', 'coc_info', 'coc_hint', 'coc_fix',
\      'ale_error', 'ale_warning', 'ale_info', 'ale_style_error', 'ale_style_warning'],
\     ['filetype'],
\     ['fileinfo']
\   ]
\ }
let g:lightline.inactive = {
\   'left' : [['filepath', 'filename_inactive']],
\   'right': [['lineinfo'], ['filetype'], ['fileinfo']]
\ }
let g:lightline.component = {
\   'mode': '%#RedStar#%#LightlineLeft_active_0#%{LightlineMode()}'
\ }
let g:lightline.component_function = {
\   'fugitive'         : 'LightlineFugitive',
\   'filepath'         : 'LightlineFilepath',
\   'filename_active'  : 'LightlineFilenameActive',
\   'filename_inactive': 'LightlineFilenameInactive',
\   'current_tag'      : 'LightlineCurrentTag',
\   'lineinfo'         : 'LightlineLineinfo',
\   'fileinfo'         : 'LightlineFileinfo',
\   'filetype'         : 'LightlineFiletype'
\ }
let g:lightline.component_expand = {
\   'coc_error'        : 'LightlineCocErrors',
\   'coc_warning'      : 'LightlineCocWarnings',
\   'coc_info'         : 'LightlineCocInfos',
\   'coc_hint'         : 'LightlineCocHints',
\   'coc_fix'          : 'LightlineCocFixes',
\   'ale_error'        : 'LightlineAleErrors',
\   'ale_warning'      : 'LightlineAleWarnings',
\   'ale_info'         : 'LightlineAleInfos',
\   'ale_style_error'  : 'LightlineAleStyleErrors',
\   'ale_style_warning': 'LightlineAleStyleWarnings'
\ }
let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
\   'ale_error'        : 'error',
\   'ale_warning'      : 'warning',
\   'ale_info'         : 'tabsel',
\   'ale_style_error'  : 'error',
\   'ale_style_warning': 'warning'
\ }
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '', 'right': ''}
" LightlineMode() {{{
function! LightlineMode() abort
  call s:hi('RedStar', '#ff0000', s:bg('LightlineLeft_active_0', 'gui')
       \             , 196, s:bg('LightlineLeft_active_0', 'cterm'))
  if &filetype ==? 'denite'
    let mode = denite#get_status('raw_mode')
    call lightline#link(tolower(mode[0]))
    return 'DENITE'
  endif
  return s:lightline_is_lean() || s:lightline_is_plain() ? toupper(&filetype) : lightline#mode()
endfunction
" }}}
" LightlineFugitive() {{{
function! LightlineFugitive() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || !exists('*fugitive#head')
    return ''
  endif
  try
    let b = fugitive#head()
  catch
    return ''
  endtry
  return b !=# '' ? '' . (winwidth(0) < 80 ? '' : ' ' . b) : ''
endfunction
" }}}
" LightlineFilepath() {{{
function! LightlineFilepath() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &filetype ==? 'denite'
    return get(get(b:, 'denite_context', {}), 'sorters', '')
  endif
  if s:lightline_is_plain() || winwidth(0) < 80
    return s:lightline_readonly()
  endif
  if exists('+shellslash')
    let saved_shellslash = &shellslash
    set shellslash
  endif
  let path_string = substitute(expand('%:h'), fnamemodify(expand('~'),''), '~', '')
  if !empty(path_string) && winwidth(0) / len(path_string) < 5
    let path_string = substitute(path_string, '\v([^/])[^/]*%(/@=|$)', '\1', 'g')
  endif
  if exists('+shellslash')
    let &shellslash = saved_shellslash
  endif
  let ro = s:lightline_readonly()
  return empty(ro) ? path_string :  ro . ' ' . path_string
endfunction
" }}}
" LightlineFilenameActive() {{{
function! LightlineFilenameActive() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &buftype ==? 'terminal'
    return has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : ''
  endif
  if &filetype ==? 'denite'
    return denite#get_status_sources()
  endif
  if &filetype ==? 'tagbar'
    return get(g:lightline, 'fname', '')
  endif
  if empty(expand('%:t'))
    return '[No Name]'
  endif

  let mo = s:lightline_modified()
  return empty(mo) ? expand('%:t') : expand('%:t') . ' ' . mo
endfunction
" }}}
" LightlineFilenameInactive() {{{
function! LightlineFilenameInactive() abort
  return s:lightline_is_lean() ? '留' . toupper(&filetype) : LightlineFilenameActive()
endfunction
" }}}
" LightlineCurrentTag() {{{
function! LightlineCurrentTag() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  if !get(s:, 'currenttag_init')
    try
      let tmp = tagbar#currenttag('%', '', '')
    catch
    endtry
    unlet! tmp
    let s:currenttag_init = 1
  endif
  if !exists('*tagbar#currenttag')
    return ''
  endif
  let now = localtime()
  if get(s:, 'currenttag_last_lookup') != now
    let s:currenttag_last_lookup = now
    let s:currenttag_last_seen = tagbar#currenttag('%s', '')
  endif
  let tag = get(s:, 'currenttag_last_seen', '')
  let limit = float2nr(0.15 * winwidth(0))
  return len(tag) > limit ? tag[0:limit] . '…' : tag
endfunction
" }}}
" LightlineLineinfo() {{{
function! LightlineLineinfo() abort
  return &filetype ==? 'help'             ? ''  :
  \      &filetype ==? 'vim-plug'         ? '⚉ ' :
  \      &filetype ==? 'defx'             ? '🖿 ' :
  \      &filetype ==? 'denite'           ? ' ' :
  \      &filetype ==? 'tagbar'           ? ' ' :
  \      &filetype =~? '\v^mundo(diff)?$' ? '⮌ ' :
  \      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
  \      printf('%d:%d ☰ %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction
" }}}
" LightlineFileinfo() {{{
function! LightlineFileinfo() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  return printf('%s[%s]',
         \      empty(&fileencoding) ? &encoding : &fileencoding,
         \      &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : ''))
endfunction
" }}}
" LightlineFiletype() {{{
function! LightlineFiletype() abort
  if empty(&filetype) || s:lightline_is_lean() || s:lightline_is_plain()
    return ''
  endif
  return &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '')
endfunction
" }}}
" LightlineCocErrors() {{{
function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction
" }}}
" LightlineCocWarnings() {{{
function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction
" }}}
" LightlineCocInfos() {{{
function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction
" }}}
" LightlineCocHints() {{{
function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
" }}}
" LightlineCocFixes() {{{
function! LightlineCocFixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction
" }}}
" LightlineAleErrors() {{{
function! LightlineAleErrors() abort
  return s:lightline_ale_diagnostic('error')
endfunction
" }}}
" LightlineAleWarnings() {{{
function! LightlineAleWarnings() abort
  return s:lightline_ale_diagnostic('warning')
endfunction
" }}}
" LightlineAleInfos() {{{
function! LightlineAleInfos() abort
  return s:lightline_ale_diagnostic('info')
endfunction
" }}}
" LightlineAleStyleErrors() {{{
function! LightlineAleStyleErrors() abort
  return s:lightline_ale_diagnostic('style_error')
endfunction
" }}}
" LightlineAleStyleWarnings() {{{
function! LightlineAleStyleWarnings() abort
  return s:lightline_ale_diagnostic('style_warning')
endfunction
" }}}
" Util {{{
" s:lightline_is_lean() {{{
function! s:lightline_is_lean() abort
  return &filetype =~? '\v^vim-plug|defx|mundo(diff)?$'
endfunction
" }}}
" s:lightline_is_plain() {{{
function! s:lightline_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|tagbar$'
endfunction
" }}}
" s:lightline_modified() {{{
function! s:lightline_modified() abort
  return s:lightline_is_lean() || s:lightline_is_plain() ?  ''  :
  \      &modified                                       ?  '' :
  \      &modifiable                                     ?  ''  : '-'
endfunction
" }}}
" s:lightline_readonly() {{{
function! s:lightline_readonly() abort
  return (s:lightline_is_lean() || s:lightline_is_plain()) && &filetype !=? 'help' ? '' : &readonly ? '' : ''
endfunction
" }}}
" s:lightline_patch_palette(colorscheme) {{{
function! s:lightline_patch_palette(colorscheme) abort
  try
    let palette = g:lightline#colorscheme#{a:colorscheme}#palette

    call add(palette.normal.left[0], 'bold')
    call add(palette.insert.left[0], 'bold')
    call add(palette.visual.left[0], 'bold')
    call add(palette.replace.left[0], 'bold')
  catch
  endtry
endfunction
" }}}
" s:lightline_coc_diagnostic(kind, sign) {{{
function! s:lightline_coc_diagnostic(kind, sign) abort
  if !get(g:, 'coc_enabled', 0)
    return ''
  endif
  let c = get(b:, 'coc_diagnostic_info', 0)
  if empty(c) || get(c, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = '!'
  endtry
  return printf('%d %s', c[a:kind], s)
endfunction
" }}}
" s:lightline_ale_diagnostic(kind) {{{
function! s:lightline_ale_diagnostic(kind) abort
  if !get(g:, 'ale_enabled', 0)
    return ''
  endif
  if !get(b:, 'ale_linted', 0)
    return ''
  endif
  if ale#engine#IsCheckingBuffer(bufnr(''))
    return ''
  endif
  let c = ale#statusline#Count(bufnr(''))
  if empty(c) || get(c, a:kind, 0) == 0
    return ''
  endif
  return printf('%d %s', c[a:kind], get(g:, 'ale_sign_' . a:kind, '!'))
endfunction
" }}}
" LightlineTagbarStatusFunc(current, sort, fname, ...) {{{
function! LightlineTagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
let g:tagbar_status_func = 'LightlineTagbarStatusFunc'
" }}}
" }}}
call s:lightline_patch_palette(g:lightline.colorscheme)
autocmd vimrc ColorScheme * call s:lightline_patch_palette(g:lightline.colorscheme)
" }}}
" goyo.vim {{{
let g:goyo_width = 120

function! s:goyo_enter_pre() abort
  if !exists('g:color_backup')
    call s:backup_prior_patches()
    call s:apply_colorscheme_patches()
  endif
  let g:goyo_bg = g:color_backup_normal.bg
endfunction

autocmd vimrc User GoyoEnterPre nested call s:goyo_enter_pre()
" }}}
" Editing
" yaifa {{{
let g:yaifa_default_tabstop = 4
" }}}
" vim-lastplace {{{
let g:lastplace_open_folds = 0
" }}}
" Navigation
" tagbar {{{
" CSS {{{
let g:tagbar_type_css = {
\   'ctagstype' : 'css',
\   'kinds'     : [
\     'c:classes',
\     's:selectors',
\     'i:identities'
\   ]
\ }
" }}}
" Go {{{
let g:tagbar_type_go = {
\   'ctagstype' : 'go',
\   'kinds' : [
\     'p:package',
\     'i:imports:1',
\     'c:constants',
\     'v:variables',
\     't:types',
\     'n:interfaces',
\     'w:fields',
\     'e:embedded',
\     'm:methods',
\     'r:constructor',
\     'f:functions'
\   ],
\   'sro' : '.',
\   'kind2scope' : {
\     't' : 'ctype',
\     'n' : 'ntype'
\   },
\   'scope2kind' : {
\     'ctype' : 't',
\     'ntype' : 'n'
\   },
\   'ctagsbin' : 'gotags',
\   'ctagsargs' : '-sort -silent'
\ }
" }}}
" Rust {{{
let g:tagbar_type_rust = {
\   'ctagstype' : 'rust',
\   'kinds' : [
\     'T:types,type definitions',
\     'f:functions,function definitions',
\     'g:enum,enumeration names',
\     's:structure names',
\     'm:modules,module names',
\     'c:consts,static constants',
\     't:traits',
\     'i:impls,trait implementations'
\   ]
\ }
" }}}
" Markdown {{{
let g:tagbar_type_markdown = {
\   'ctagstype' : 'markdown',
\   'kinds' : [
\     'h:Heading_L1',
\     'i:Heading_L2',
\     'k:Heading_L3'
\   ]
\ }
" }}}
" Ruby {{{
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
  \   'kinds' : [
  \     'm:modules',
  \     'c:classes',
  \     'C:constants',
  \     'F:singleton methods',
  \     'f:methods',
  \     'a:aliases'
  \   ],
  \   'kind2scope' : {
  \     'c' : 'class',
  \     'm' : 'class'
  \   },
  \   'scope2kind' : {'class' : 'c'},
  \   'ctagsbin' : 'ripper-tags',
  \   'ctagsargs' : ['-f', '-']
  \ }
else
  let g:tagbar_type_ruby = {
  \   'kinds' : [
  \     'm:modules',
  \     'c:classes',
  \     'd:describes',
  \     'C:contexts',
  \     'f:methods',
  \     'F:singleton methods'
  \   ]
  \ }
endif
" }}}
" TypeScript {{{
let g:tagbar_type_typescript = {
\   'ctagsbin' : 'tstags',
\   'ctagsargs' : '-f-',
\   'kinds': [
\     'e:enums:0:1',
\     'f:function:0:1',
\     't:typealias:0:1',
\     'M:Module:0:1',
\     'I:import:0:1',
\     'i:interface:0:1',
\     'C:class:0:1',
\     'm:method:0:1',
\     'p:property:0:1',
\     'v:variable:0:1',
\     'c:const:0:1'
\   ],
\   'sort' : 0
\ }
" }}}
" }}}
" denite.nvim {{{
function! s:denite_config() abort
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#map('insert' , '<c-j>' , '<denite:move_to_next_line>'     , 'noremap')
  call denite#custom#map('insert' , '<c-k>' , '<denite:move_to_previous_line>' , 'noremap')
  call denite#custom#map('insert' , '<c-g>' , '<denite:insert_digraph>'        , 'noremap')
  call denite#custom#map('insert' , '<c-t>' , '<denite:input_command_line>'    , 'noremap')
  call denite#custom#alias('source' , 'buffer_proj'   , 'buffer')
  call denite#custom#alias('source' , 'file_mru_proj' , 'file_mru')
  call denite#custom#source('buffer_proj'   , 'matchers' , ['matcher/fuzzy' , 'matcher/project_files'])
  call denite#custom#source('file_mru_proj' , 'matchers' , ['matcher/fuzzy' , 'matcher/project_files'])
endfunction

autocmd vimrc VimEnter * if exists('g:loaded_denite') | call s:denite_config() | endif
" }}}
" Project Structure
" vim-obsession {{{
let g:obsession_no_bufenter = 1
" }}}
" vim-localvimrc {{{
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" }}}
" editorconfig-vim {{{
let g:EditorConfig_max_line_indicator = 'none'
" }}}
" Source Control
" vim-gitgutter {{{
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_override_sign_column_highlight = 0
autocmd vimrc VimEnter,ColorScheme *
\   call s:hi('GitGutterAdd',
\             s:fg('GitGutterAdd', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterAdd', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterChange',
\             s:fg('GitGutterChange', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterChange', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterDelete',
\             s:fg('GitGutterDelete', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterDelete', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterChangeDelete',
\             s:fg('GitGutterChangeDelete', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterChangeDelete', 'cterm'), s:bg('SignColumn', 'cterm'))
" }}}
" Code Evaluation
" vim-slime {{{
let g:slime_target = 'tmux'
let g:slime_dont_ask_default = 1
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{right-of}'}
" }}}
" vim-quickrun {{{
let g:quickrun_config = {
\   '_': {
\     'outputter/buffer/close_on_empty': 1
\   },
\   'c' : {
\     'command': 'clang',
\     'cmdopt': '-g -O0 -Wall -Wextra -std=gnu11 -lpthread'
\   },
\   'cpp' : {
\     'command': 'clang++',
\     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++17 -stdlib=libc++ -lc++abi -lpthread -I/opt/src/range-v3/include -I/opt/src/GSL/include'
\   },
\   'swift' : {
\     'command': 'swiftc',
\     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.swift',
\     'hook/sweep/files': ['%S:p:r']
\   },
\   'ocaml' : {
\     'command': 'corebuild',
\     'cmdopt': '-quiet',
\     'exec': ['%c %o %s:t:r.byte', './%s:t:r.byte %a'],
\     'tempfile': '%{tempname()}.ml',
\     'hook/cd/directory': '%S:p:h'
\   },
\   'dats' : {
\     'command': 'patscc',
\     'cmdopt': '-cleanaft',
\     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.dats',
\     'hook/sweep/files': ['%S:p:r']
\   },
\   'rust' : {
\     'command': 'cargo',
\     'cmdopt': 'run --quiet',
\     'exec': ['%c %o']
\   }
\ }
" }}}
" Exporting
" gist-vim {{{
let g:gist_put_url_to_clipboard_after_post = 1
" }}}
" formatvim {{{
let g:format_FormatConcealed = 1
let g:format_HTMLAdditionalCSS = '
\ @font-face {
\   font-family: "Monoid";
\   src: local("Monoid Regular"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-regular.woff2") format("woff2"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-regular.woff") format("woff");
\   font-weight: normal;
\   font-style: normal;
\ }
\
\ @font-face {
\   font-family: "Monoid";
\   src: local("Monoid Bold"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-bold.woff2") format("woff2"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-bold.woff") format("woff");
\   font-weight: bold;
\   font-style: normal;
\ }
\
\ @font-face {
\   font-family: "Monoid";
\   src: local("Monoid Italic"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-italic.woff2") format("woff2"),
\     url("https://s3.amazonaws.com/oblitum-fonts/monoid-italic.woff") format("woff");
\   font-weight: normal;
\   font-style: italic;
\ }
\
\ body {
\   font-family: "Monoid", "Bitstream Vera Sans Mono", "DejaVu Sans Mono", Monaco, monospace;
\   font-size:9pt;
\   -webkit-font-smoothing: antialiased;
\ }'
" }}}
" Diagnostics
" ale {{{
" Disable linters that conflict with coc.nvim
" (and other annoying ones)
let g:ale_linters = {
\   'c': [], 'cpp': [], 'go': [], 'rust': [], 'python': [], 'sh': [],
\   'html': [], 'css': [], 'javascript': [], 'typescript': [], 'reason': [],
\   'json': [], 'vue': []
\ }
let g:ale_linters_ignore = {
\   'tex': ['lacheck']
\ }

let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_style_error = ''
let g:ale_sign_style_warning = ''

autocmd vimrc User ALEJobStarted call lightline#update()
autocmd vimrc User ALELintPost   call lightline#update()
autocmd vimrc User ALEFixPost    call lightline#update()

" Diagnostic's highlighting {{{
function! s:ale_highlight() abort
  hi! link ALEErrorLine SignColumn
  hi! link ALEWarningLine SignColumn
  hi! link ALEInfoLine SignColumn
  if exists('g:loaded_lightline')
    let c = g:lightline#palette().normal.error[0]
    let i = s:farthest_color(s:bg('ALEErrorLine', 'gui'), c[:1])
    call s:hi('ALEErrorSign', c[0+i], s:bg('ALEErrorLine', 'gui')
         \                  , c[2+i], s:bg('ALEErrorLine', 'cterm'))
    let c = g:lightline#palette().normal.warning[0]
    let i = s:farthest_color(s:bg('ALEWarningLine', 'gui'), c[:1])
    call s:hi('ALEWarningSign', c[0+i], s:bg('ALEWarningLine', 'gui')
         \                   , c[2+i], s:bg('ALEWarningLine', 'cterm'))
    let c = g:lightline#palette().tabline.tabsel[0]
    let i = s:farthest_color(s:bg('ALEInfoLine', 'gui'), c[:1])
    call s:hi('ALEInfoSign', c[0+i], s:bg('ALEInfoLine', 'gui')
         \                 , c[2+i], s:bg('ALEInfoLine', 'cterm'))
  else
    call s:hi('ALEErrorSign'   , 'lightred'  , s:bg('ALEErrorLine'   , 'gui')
         \                     , 'lightred'  , s:bg('ALEErrorLine'   , 'cterm'))
    call s:hi('ALEWarningSign' , 'yellow'    , s:bg('ALEWarningLine' , 'gui')
         \                     , 'yellow'    , s:bg('ALEWarningLine' , 'cterm'))
    call s:hi('ALEInfoSign'    , 'lightblue' , s:bg('ALEInfoLine'    , 'gui')
         \                     , 'lightblue' , s:bg('ALEInfoLine'    , 'cterm'))
  endif
endfunction

autocmd vimrc VimEnter,ColorScheme * call s:ale_highlight()
" }}}
" }}}
" coc.nvim {{{
function! s:coc_config() abort
  let root_patterns = ['.vim/', '.git/', '.hg/', '.projections.json']

  let g:coc_status_error_sign = ''
  let g:coc_status_warning_sign = ''

  call coc#config('suggest', {
  \   'snippetIndicator' :' ',
  \   'messageLevel': 'warning'
  \ })

  call coc#config('diagnostic', {
  \   'errorSign'  : '',
  \   'warningSign': '',
  \   'infoSign'   : '',
  \   'hintSign'   : 'ﯦ'
  \ })

  let languageservers = {}

  if executable('ccls')
    let languageservers['ccls'] = {
    \   'command': 'ccls',
    \   'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
    \   'rootPatterns': ['.ccls', 'compile_commands.json'] + root_patterns,
    \   'initializationOptions': {
    \     'cacheDirectory': '/tmp/ccls'
    \   }
    \ }
  endif
  if executable('bingo')
    let languageservers['golang'] = {
    \   'command': 'bingo',
    \   'args': ['--diagnostics-style=instant'],
    \   'filetypes': ['go'],
    \   'rootPatterns': ['go.mod'] + root_patterns
    \ }
  endif
  if executable('reason-language-server')
    let languageservers['reason'] = {
    \   'command': 'reason-language-server',
    \   'filetypes': ['reason']
    \ }
  endif
  if executable('bash-language-server')
    let languageservers['bash'] = {
    \   'command': 'bash-language-server',
    \   'args': ['start'],
    \   'filetypes': ['sh'],
    \   'ignoredRootPaths': ['~']
    \ }
  endif

  if !empty(languageservers)
    call coc#config('languageserver', languageservers)
  endif
endfunction

autocmd vimrc VimEnter * if exists('g:did_coc_loaded') | call s:coc_config() | endif

autocmd vimrc User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Diagnostic's feedback {{{
function! CocUpdateQuickFixes(error, actions) abort
  let coc_quickfixes = {}
  try
    for action in a:actions
      if action.kind ==? 'quickfix'
        for change in action.edit.documentChanges
          for edit in change.edits
            let start_line = edit.range.start.line + 1
            let end_line = edit.range.end.line + 1
            let coc_quickfixes[start_line] = get(coc_quickfixes, start_line, 0) + 1
            if start_line != end_line
              let coc_quickfixes[end_line] = get(coc_quickfixes, end_line, 0) + 1
            endif
          endfor
        endfor
      endif
    endfor
  catch
  endtry
  if coc_quickfixes != get(b:, 'coc_quickfixes', {})
    let b:coc_quickfixes = coc_quickfixes
    call lightline#update()
  endif
endfunction

autocmd vimrc User CocDiagnosticChange
\   call lightline#update()
\|  call CocActionAsync('quickfixes', function('CocUpdateQuickFixes'))

function! s:coc_fix_on_cursor_moved() abort
  let current_line = line('.')
  if current_line != get(b:, 'last_line', 0)
    let b:last_line = current_line
    if has_key(get(b:, 'coc_quickfixes', {}), current_line)
      call lightline#update()
    else
      if get(b:, 'coc_line_fixes', 0) > 0
        call lightline#update()
      endif
    endif
  endif
endfunction

autocmd vimrc CursorMoved * call s:coc_fix_on_cursor_moved()
" }}}
" Diagnostic's highlighting {{{
function! s:coc_highlight() abort
  hi! link CocHighlightText Search
  hi! link CocErrorLine SignColumn
  hi! link CocWarningLine SignColumn
  hi! link CocInfoLine SignColumn
  hi! link CocHintLine SignColumn
  if exists('g:loaded_lightline')
    let c = g:lightline#palette().normal.error[0]
    let i = s:farthest_color(s:bg('CocErrorLine', 'gui'), c[:1])
    call s:hi('CocErrorSign', c[0+i], s:bg('CocErrorLine', 'gui')
         \                  , c[2+i], s:bg('CocErrorLine', 'cterm'))
    let c = g:lightline#palette().normal.warning[0]
    let i = s:farthest_color(s:bg('CocWarningLine', 'gui'), c[:1])
    call s:hi('CocWarningSign', c[0+i], s:bg('CocWarningLine', 'gui')
         \                    , c[2+i], s:bg('CocWarningLine', 'cterm'))
    let c = g:lightline#palette().tabline.tabsel[0]
    let i = s:farthest_color(s:bg('CocInfoLine', 'gui'), c[:1])
    call s:hi('CocInfoSign', c[0+i], s:bg('CocInfoLine', 'gui')
         \                 , c[2+i], s:bg('CocInfoLine', 'cterm'))
    call s:hi('CocHintSign', g:lightline#palette().tabline.tabsel[0][0]
         \                 , s:bg('CocHintLine', 'gui')
         \                 , g:lightline#palette().tabline.tabsel[0][2]
         \                 , s:bg('CocHintLine', 'cterm'))
  else
    call s:hi('CocErrorSign'   , 'lightred'  , s:bg('CocErrorLine'   , 'gui')
         \                     , 'lightred'  , s:bg('CocErrorLine'   , 'cterm'))
    call s:hi('CocWarningSign' , 'yellow'    , s:bg('CocWarningLine' , 'gui')
         \                     , 'yellow'    , s:bg('CocWarningLine' , 'cterm'))
    call s:hi('CocInfoSign'    , 'lightblue' , s:bg('CocInfoLine'    , 'gui')
         \                     , 'lightblue' , s:bg('CocInfoLine'    , 'cterm'))
    call s:hi('CocHintSign'    , 'cyan'      , s:bg('CocHintLine'    , 'gui')
         \                     , 'cyan'      , s:bg('CocHintLine'    , 'cterm'))
  endif
endfunction

autocmd vimrc VimEnter,ColorScheme * call s:coc_highlight()
" }}}
" }}}
" Speech
" translate-shell.vim {{{
let g:trans_default_direction = ':pt'
" }}}
" vim-grammarous {{{
let g:grammarous#languagetool_cmd = 'languagetool'
" }}}
" Writting
" vim-journal {{{
let g:journal#dirs =  ['Notes', 'notes', 'journal.d']
" }}}
" }}}
" Command {{{
" :FancyPaste [register]               | paste block onto new lines {{{
function! s:fancy_paste(register) abort
  let s = repeat(' ', virtcol('.')-1)
  call append(line('.'), map(split(getreg(a:register), '\n'), {_, v -> s . v}))
endfunction

command! -register FancyPaste call s:fancy_paste('<reg>')
" }}}
" :BufOut {command}                    | edit command output in a buffer {{{
command! -nargs=+ BufOut redir => bufout | silent <args> | redir end | new | call append(0, split(bufout, '\n'))
" }}}
" :Messages                            | edit :messages output in a buffer {{{
command! Messages :redir => bufout | silent :messages | redir end | new | call append(0, split(bufout, '\n'))
" }}}
" :[range]Blocks                       | gist it to bl.ocks.org {{{
function! s:blocks() range abort
  call plug#load('frawor', 'formatvim')
  call s:restore(g:color_backup)
  exec a:firstline . ',' . a:lastline . 'Format format'
  call s:apply_colorscheme_patches()
  file index.html
  exec 'Gist! -p'
  bd!
  let @+ = 'http://bl.ocks.org/oblitum/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/'
  let @+ = bitly#shorten(@+).url
  redraw
  echom 'Done: ' . @+
  setlocal nomodified
endfunction

command! -range=% Blocks <line1>,<line2>call s:blocks()
" }}}
" :Fold [buffer]                       | fold buffer using coc.nvim {{{
function! s:coc_fold_kinds(...) abort
  return ['imports', 'comment', 'region']
endfunction

command! -nargs=? -complete=customlist,s:coc_fold_kinds
\   Fold :call CocAction('fold', <f-args>)
" }}}
" :LightlineColors {colorscheme}       | set lightline.vim colorscheme {{{
function! s:set_lightline_colors(colorscheme) abort
  let g:lightline.colorscheme = a:colorscheme
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
  exec 'colorscheme ' . get(g:, 'colors_name', 'default')
endfunction

function! s:lightline_colorschemes(...) abort
  return join(map(globpath(&runtimepath, 'autoload/lightline/colorscheme/*.vim', 1, 1),
         \        "fnamemodify(v:val,':t:r')"), "\n")
endfunction

command! -nargs=1 -complete=custom,s:lightline_colorschemes
\   LightlineColors call s:set_lightline_colors(<q-args>)
" }}}
" :SyncTmuxline [mode]                 | sync tmuxline to lightline {{{
function! s:sync_tmuxline(...) abort
  call assert_inrange(0, 1, a:0)
  let m = a:0 > 0 ? a:1 : s:guicolors() ? 'gui' : 'cterm'
  if m ==# 'gui'
    let base = 0
    let F = {s -> '"'.s.'"'}
  elseif m ==# 'cterm'
    let base = 2
    let F = {s -> 'colour'.s}
  else
    return
  endif
  let C = {c, v -> printf(' -e ''s/^\(\s*%s\s*=\s*\)\S.*/\1%s/'' ', c, v)}
  let i = s:farthest_color(g:lightline#palette().normal.middle[0][1], ['#ffffff', '#000000'])
  call system('sed -i'
       \.     C('FGL1', F(g:lightline#palette().normal.left[0][base+0]))
       \.     C('FGL2', F(g:lightline#palette().normal.middle[0][base+0]))
       \.     C('FGL3', F(g:lightline#palette().normal.left[1][base+0]))
       \.     C('FGR1', F(g:lightline#palette().normal.right[0][base+0]))
       \.     C('FGR2', F(g:lightline#palette().normal.right[1][base+0]))
       \.     C('FGR3', F(g:lightline#palette().normal.middle[0][base+0]))
       \.     C('FGLC', F(['#ffffff', '#000000', '255', '0'][base+i]))
       \.     C('BGL1', F(g:lightline#palette().normal.left[0][base+1]))
       \.     C('BGL2', F(g:lightline#palette().normal.middle[0][base+1]))
       \.     C('BGL3', F(g:lightline#palette().normal.left[1][base+1]))
       \.     C('BGR1', F(g:lightline#palette().normal.right[0][base+1]))
       \.     C('BGR2', F(g:lightline#palette().normal.right[1][base+1]))
       \.     '~/.tmuxline.conf')
  call system('tmux source ~/.tmuxline.conf')
endfunction

command! -nargs=? SyncTmuxline call s:sync_tmuxline(<f-args>)
" }}}
" :SyncTermite [alpha]                 | sync termite to colorscheme {{{
function! s:sync_termite(...) abort
  call assert_inrange(0, 1, a:0)
  let alpha = a:0 > 0 ? a:1 : 1
  let C = {c, v -> printf(' -e ''s/^\(\s*%s\s*=\s*\)\S.*/\1%s/'' ', c, v)}
  call system('sed -i'
       \.     C('background', s:rgba(g:color_backup_normal.gui.bg, alpha))
       \.     C('foreground', g:color_backup_normal.gui.fg)
       \.     C('foreground_bold', g:color_backup_normal.gui.fg)
       \.     C('cursor', g:color_backup_normal.gui.fg)
       \.     '~/.config/termite/config')
  call system('killall -USR1 termite')
endfunction

command! -nargs=? SyncTermite call s:sync_termite(<f-args>)
" }}}
" :SyncWallpaper                       | sync wallpaper to lightline {{{
function! s:sync_wallpaper() abort
  let F = {s -> '"'.s.'"'}
  let C = {c, v -> printf(' -e ''s/^\(\s*%s\s*=\s*\)\S.*/\1%s/'' ', c, v)}
  let gc = g:lightline#palette().normal.middle[0][1]
  let bc = ['#ffffff', '#000000']
  let bi = s:farthest_color(gc, bc)
  let ec = g:lightline#palette().normal.error[0]
  let ei = s:farthest_color(gc, ec[:1])
  let wc = g:lightline#palette().normal.warning[0]
  let wi = s:farthest_color(gc, wc[:1])
  call system('sed -i'
       \.     C('FC1', F(g:lightline#palette().normal.left[1][0]))
       \.     C('FC2', F(g:lightline#palette().normal.middle[0][0]))
       \.     C('BC1', F(bc[bi]))
       \.     C('DC1', F(g:lightline#palette().normal.left[0][1]))
       \.     C('DC2', F(ec[ei]))
       \.     C('LC1', F(g:lightline#palette().normal.left[1][1]))
       \.     C('LC2', F(wc[wi]))
       \.     C('BG1', F(gc))
       \.     '~/.local/bin/wallpaper')
  call system('systemctl --user restart wallpaper')
endfunction

command! -nargs=0 SyncWallpaper call s:sync_wallpaper()
" }}}
" :Synci3                              | sync i3 to lightline {{{
function! s:sync_i3() abort
  let C = {c, v -> printf(' -e ''s/^\(\s*set\s\+\$%s\s\+\)\S.*/\1%s/'' ', c, v)}
  let gc = g:lightline#palette().normal.middle[0][1]
  let ac = ['#ffffff', '#000000']
  let ai = s:farthest_color(gc, ac)
  call system('sed -i'
       \.     C('FGL1', g:lightline#palette().normal.left[0][0])
       \.     C('FGL2', g:lightline#palette().normal.left[1][0])
       \.     C('FGLA', ac[ai])
       \.     C('FGR1', g:lightline#palette().normal.middle[0][0])
       \.     C('FGR2', g:lightline#palette().normal.middle[0][0])
       \.     C('BGL1', g:lightline#palette().normal.left[0][1])
       \.     C('BGL2', g:lightline#palette().normal.left[1][1])
       \.     C('BGL3', gc)
       \.     C('BGLA', gc)
       \.     '~/.config/i3/config')
  let F = {s -> '"'.s.'"'}
  let C = {c, v -> printf(' -e ''s/^\(\s*%s\s*=\s*\)\S.*/\1%s/'' ', c, v)}
  let gc = g:lightline#palette().normal.middle[0][1]
  let wc = g:lightline#palette().normal.warning[0]
  let wi = s:farthest_color(gc, wc[:1])
  let ec = g:lightline#palette().normal.error[0]
  let ei = s:farthest_color(gc, ec[:1])
  call system('sed -i'
       \.     C('color_good', F(g:lightline#palette().normal.left[0][1]))
       \.     C('color_degraded', F(wc[wi]))
       \.     C('color_bad', F(ec[ei]))
       \.     '~/.i3status.conf')
  call system('i3-msg reload')
endfunction

command! -nargs=0 Synci3 call s:sync_i3()
" }}}
" :SyncColors [alpha] [mode]           | sync all to lightline {{{
function! s:sync_colors(...) abort
  if a:0 > 0
    call s:sync_termite(a:1)
  else
    call s:sync_termite()
  endif
  if a:0 > 1
    call s:sync_tmuxline(a:2)
  else
    call s:sync_tmuxline()
  endif
  call s:sync_i3()
  call s:sync_wallpaper()
endfunction

command! -nargs=* SyncColors call s:sync_colors(<f-args>)
" }}}
" }}}
" Mapping {{{
" Implicit <leader> mappings in use by plugins:
" a b e g l r s w z

" Plugin {{{
" Highlighting
" vim-plugin-AnsiEsc {{{
let g:no_cecutil_maps = 1
" }}}
" vim-indent-guides {{{
let g:indent_guides_default_mapping = 0
" }}}
" UI
" vim-maximizer {{{
let g:maximizer_set_default_mapping = 0

nnoremap <silent> <leader>m :MaximizerToggle!<cr>
" }}}
" vim-sayonara {{{
nnoremap <silent> <leader>q :Sayonara!<cr>
" }}}
" goyo.vim {{{
nnoremap <silent> <leader>M :Goyo<cr>
" }}}
" Editing
" emmet-vim {{{
let g:user_emmet_leader_key = '<c-space>'
" }}}
" vim-wordmotion {{{
let g:wordmotion_prefix = '<leader>'
" }}}
" Navigation
" tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" }}}
" defx.nvim {{{
nnoremap <silent> <leader>D :Defx -split=vertical -winwidth=50 -direction=topleft -columns=icons:filename:type<cr>
autocmd vimrc FileType defx call s:defx_mappings()
function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> d defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> l defx#do_action('open_directory')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> D defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> <cr> defx#do_action('drop')
  nnoremap <silent><buffer><expr> <c-p> defx#do_action('print')
  nnoremap <silent><buffer><expr> <c-r> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> <RightMouse> defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('drop')
endfunction
" }}}
" denite.nvim {{{
nnoremap <silent> <leader>df :<c-u>Denite file<cr>
nnoremap <silent> <leader>dF :<c-u>DeniteProjectDir file<cr>
nnoremap <silent> <leader>dr :<c-u>Denite file_rec<cr>
nnoremap <silent> <leader>dR :<c-u>DeniteProjectDir file_rec<cr>
nnoremap <silent> <leader>db :<c-u>Denite buffer<cr>
nnoremap <silent> <leader>dB :<c-u>Denite buffer_proj<cr>
nnoremap <silent> <leader>dm :<c-u>Denite file_mru<cr>
nnoremap <silent> <leader>dM :<c-u>Denite file_mru_proj<cr>
nnoremap <silent> <leader>dl :<c-u>Denite location_list<cr>
nnoremap <silent> <leader>dq :<c-u>Denite quickfix<cr>
nnoremap <silent> <leader>du :<c-u>Denite coc-link<cr>
nnoremap <silent> <leader>dc :<c-u>Denite coc-command<cr>
nnoremap <silent> <leader>ds :<c-u>Denite coc-symbols<cr>
nnoremap <silent> <leader>dS :<c-u>Denite coc-service<cr>
nnoremap <silent> <leader>de :<c-u>Denite coc-extension<cr>
nnoremap <silent> <leader>dw :<c-u>Denite coc-workspace<cr>
nnoremap <silent> <leader>dd :<c-u>Denite coc-diagnostic<cr>
" }}}
" Source Control
" vim-gitgutter {{{
let g:gitgutter_map_keys = 0

nmap         [h <Plug>GitGutterPrevHunk
nmap         ]h <Plug>GitGutterNextHunk
omap         ih <Plug>GitGutterTextObjectInnerPending
omap         ah <Plug>GitGutterTextObjectOuterPending
xmap         ih <Plug>GitGutterTextObjectInnerVisual
xmap         ah <Plug>GitGutterTextObjectOuterVisual
nmap <leader>hu <Plug>GitGutterUndoHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hp <Plug>GitGutterPreviewHunk
" }}}
" Code Evaluation
" vim-slime {{{
xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend
" }}}
" vim-quickrun {{{
nmap <silent> <leader><cr> <Plug>(quickrun)
" }}}
" Debugging
" vim-vebugger {{{
let g:vebugger_leader = '<leader>v'
" }}}
" Snippets
" ultisnips {{{
let g:UltiSnipsExpandTrigger = '<c-space>s'
" }}}
" Diagnostics
" coc.nvim {{{
nmap     <silent>       <leader>cf <Plug>(coc-format)
vmap     <silent>       <leader>cf <Plug>(coc-format-selected)
nmap     <silent>       <leader>ca <Plug>(coc-codeaction)
vmap     <silent>       <leader>ca <Plug>(coc-codeaction-selected)
nmap     <silent>       <leader>cl <Plug>(coc-codelens-action)
nmap     <silent>       <leader>cI <Plug>(coc-diagnostic-info)
nmap     <silent>       <leader>c[ <Plug>(coc-diagnostic-prev)
nmap     <silent>       <leader>c] <Plug>(coc-diagnostic-next)
nmap     <silent>       <leader>cd <Plug>(coc-definition)
nmap     <silent>       <leader>ci <Plug>(coc-implementation)
nmap     <silent>       <leader>ct <Plug>(coc-type-definition)
nmap     <silent>       <leader>cn <Plug>(coc-rename)
nmap     <silent>       <leader>cr <Plug>(coc-references)
nmap     <silent>       <leader>co <Plug>(coc-openlink)
nmap     <silent>       <leader>cq <Plug>(coc-fix-current)
nnoremap <silent>       <leader>ch :call CocActionAsync('highlight')<cr>
nnoremap <silent>       <leader>cH :call CocActionAsync('doHover')<cr>
inoremap <silent><expr> <c-space>r coc#refresh()
" }}}
" }}}
" Command {{{
nnoremap <silent> <leader>f :Fold<cr>
nnoremap <silent> <leader>p :FancyPaste<cr>
" }}}
" Other {{{
" CTRL-W__ and CTRL-W_bar on steroids (resize windows adjusting to text)
nnoremap <expr><silent> <c-w>_ (v:count ? v:count : float2nr(ceil(eval(join(map(getline(1,'$'),'max([winwidth(0),virtcol([v:key+1,"$"])])'),'+'))/str2float(winwidth(0).'.0'))))."\<c-w>_"
nnoremap <expr><silent> <c-w><bar> (v:count ? v:count : max(map(getline(1,'$'),'virtcol([v:key+1,"$"])'))-1)."\<c-w>\<bar>"
" Tab navigation
nnoremap <silent> <leader>[ :tabprevious<cr>
nnoremap <silent> <leader>] :tabnext<cr>
nnoremap <silent> <leader>= :tabnew<cr>
nnoremap <silent> <leader>- :tabclose<cr>
nnoremap <silent> <leader><bs> :exec 'set showtabline='.string(!&showtabline)<cr>
" Toggle shell pasting
set pastetoggle=<leader>P
" }}}
" }}}
