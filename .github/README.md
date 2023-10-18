# dotfiles

[Install yadm](https://yadm.io/docs/install) & then run

```bash
yadm clone git@github.com:paddyroddy/dotfiles.git
```

Install vim-plug

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugins for vim

```
nvim +PlugInstall +qa
```

Source shell

```
exec zsh
```
