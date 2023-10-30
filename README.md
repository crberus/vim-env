# vim-env
My personal vim environment

# Instructions (I'm 40 now...)

## Clone Repository
1. `cd ~`
2. `git clone git@github.com:crberus/vim-env.git .vim`
3. `ln -s .vim/.vimrc`
4. `cd ~/.vim && git submodule update --init --recursive`

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
    `+big+python39`
- *jedi* should be installed via macports: `py39-jedi`
