if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/kurahara/.vimrc', '/home/kurahara/.vim/rc/dein.toml', '/home/kurahara/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/kurahara/.cache/dein'
let g:dein#_runtime_path = '/home/kurahara/.cache/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/kurahara/.cache/dein/.cache/.vimrc'
let &runtimepath = '/home/kurahara/.cache/dein/repos/github.com/Shougo/dein.vim/,/home/kurahara/.vim,/usr/share/vim/vimfiles,/home/kurahara/.cache/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/home/kurahara/.cache/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/kurahara/.vim/after'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* <C-w> call dein#autoload#_on_cmd('<C-w>', 'winresizer', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* NERDTreeToggle call dein#autoload#_on_cmd('NERDTreeToggle', 'nerdtree', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
    let g:lightline = { 'colorscheme': 'onedark'}
    colorscheme onedark 
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_enable_camel_case_completion = 0
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim'])
