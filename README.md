VIM config!

Remember to:
* echo "source ~/.vim/vimrc" > ~/.vimrc
* run `git submodule update --init` 
* install nvim and do the nvim-to-vim thing. This includes creating a file with the following at ~/.config/nvim/init.vim:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
* once in vim, `:helptags ALL` to populate helptags
* install clang for C/C++ linting, completion, etc. (and generate compile_commands.json file with bear [per project])

...or just run setup.sh (doesn't install clang)

