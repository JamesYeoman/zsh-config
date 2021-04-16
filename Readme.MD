# Configuration files for zsh
## Installation
Run `wget -qO- https://raw.githubusercontent.com/JamesYeoman/zsh-config/master/coredeps.sh | bash`

Run `chsh -s /usr/bin/zsh` to set ZSH as the default shell for your account

# List of planned changes
 - [x] Make a post on reddit
   - This lets people critisize the hell out of this config (constructive criticism) so I can make it an even better config
 - [x] Make user overrides completely separate from the core config
   - This means having all user override files in their own folder
      - `${ZDOTDIR}/modules/base/user_defs.zsh`
      - `${ZDOTDIR}/modules/interactive/user_defs.zsh`
      - `${ZDOTDIR}/.p10k.zsh`
 - [ ] Enable user-defined aliases
 - [ ] Make platform dependencies less of an issue (nice to have)
   - Things like `apt-get` for example
