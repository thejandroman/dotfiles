# Personal Emacs configs

This is meant to be used in conjunction with
[emacs-prelude](https://github.com/bbatsov/prelude). It should work
fine on a Mac and possibly on some Debian based Linux.

## Getting started

``` shell
EMACS_PERSONAL="~/.emacs.d/personal"
rm -rf "${EMACS_PERSONAL}"
git clone --recursive https://github.com/thejandroman/emacs_personal.git "${EMACS_PERSONAL}"
```

## Dependencies

Some dependencies can be installed with [homebrew](https://brew.sh/) on Mac:

``` shell
brew bundle --file="~/.emacs.d/personal/Brewfile"
```

- [eslint](https://eslint.org/)
- [livedown](https://github.com/shime/livedown)
- [rbenv](https://github.com/rbenv/rbenv)
