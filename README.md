# dotfiles

```
git clone --recurse-submodules -j8 https://github.com/thejandroman/dotfiles.git ~/dotfiles
```

## Emacs
```
ln -s ~/dotfiles/emacs.d ~/.emacs.d
```

## zprezto
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
ln -s "${ZDOTDIR:-$HOME}"/dotfiles/zsh.prompts" "${ZDOTDIR:-$HOME}/.zsh.prompts"
```
