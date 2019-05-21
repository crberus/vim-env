# vim-env
My personal vim environment

# Instructions (I'm 40 now...)

## Clone Repository
1. `cd ~`
2. `git clone git@github.com:crberus/vim-env.git .vim`
3. `ln -s .vim/.vimrc`

## "Install" Pathogen (latest)
4. `mkdir ~/.vim/autoload`
5. `curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`

**Reminders to self:**
- `autoload/` is ignored intentionally so you must install pathogen from
  latest (above)
- Make all pathogen bundles submodules rather than clones

# jedi-vim Notes
- *vim* should be installed via macports with the following variants:
    `+big+python27+python36`
- *jedi* should be installed via macports: `py36-jedi` & `py27-jedi`
