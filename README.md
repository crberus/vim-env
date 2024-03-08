# vim-env
My personal vim environment

# Instructions (I'm 40 now...)

## Clone Repository
1. `cd ~`
2. `git clone git@github.com:crberus/vim-env.git .vim`
3. `ln -s .vim/.vimrc`
4. `cd ~/.vim & git submodule update --init --recursive`

## "Install" Pathogen (latest)
5. `mkdir ~/.vim/autoload`
6. `curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`

**Reminders to self:**
- `autoload/` is ignored intentionally so you must install pathogen from
  latest (above)
- Make all pathogen bundles submodules rather than clones
- To update all submodules at a later time (after the initial setup):
  `git submodule update --recursive`

# jedi-vim Notes
- *vim* should be installed via macports with the following variants:
    `+big+python2<x>+python3<x>`
- *jedi* should be installed via macports: `py3<x>-jedi` & `py2<x>-jedi`

# GitHub Copilot Install Notes
## Resources
[copilot.vim](https://github.com/github/copilot.vim)
[Using GitHub Co-Pilot With VIM](https://ovid.github.io/articles/using-github-copilot-with-vim.html)

## Installation Notes
1. installed node.js through macports
    `port install nodejs<ver>`
2. _installed_ the submodule for pathogen autoload
    ```
    cd ~/.vim
    git submodule add https://github.com/github/copilot.vim.git bundle/copilot.vim
    ```
3. enabled/activated in VIM `:Copilot setup`
