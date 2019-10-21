# Configuration files for zsh

## Requirements

- [https://github.com/zsh-users/antigen](Antigen). To install, simply clone the repo into `/usr/local/share`
- Powerline fonts
  - You can find an install guide [https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#step-2-install-a-powerline-font](here)
- Optional requirement, but you'll have to change the `ls` aliases in aliases.zsh if you decide to not install [https://the.exa.website/](exa)

## Installation

1. Clone this repo into `~/.config`, naming the clone folder as `zsh`
2. Copy the dotfile from `dotfiles/` to your home directory
3. Run ZSH (`exec zsh`) if you're currently running bash
4. (optional) Run `chsh -s /usr/bin/zsh` to set ZSH as the default shell for your account

