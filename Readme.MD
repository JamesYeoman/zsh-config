# Configuration files for zsh

## Requirements

- [Antigen](https://github.com/zsh-users/antigen). To install, simply clone the repo into `/usr/local/share`
- Optional requirement, but you'll have to change the `ls` aliases in aliases.zsh if you decide to not install [exa](https://the.exa.website/)

## Installation

1. Clone this repo into `~/.config`, naming the clone folder as `zsh`
2. Copy the dotfile from `dotfiles/` to your home directory
3. Run ZSH (`exec zsh`) if you're currently running bash
4. Run installzshfonts to install a set of fonts that support the glyphs used by Powerline9k
5. Close and reopen your terminal window so that it can pick up the new fonts
6. Set your terminal font to one of the `Droid Sans Mono Nerd Font` fonts
7. (optional) Run `chsh -s /usr/bin/zsh` to set ZSH as the default shell for your account

