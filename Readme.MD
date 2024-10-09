# Configuration files for zsh

## Installation

```bash
# Download and run the installer, which installs git, zsh, antigen,
# and some "core" linux tools that don't get installed by default
# for some reason on most distros
# (e.g. apt-transport-https, ca-certificates, curl).
#
# And obviously it handles installing the config and patching
# the system shell startup scripts to set the $ZDOTDIR to
# be XDG-Compliant. This also includes adding a common profile
# shared between ZSH and BASH, so that XDG compliance can be
# system wide
wget -qO- https://raw.githubusercontent.com/JamesYeoman/zsh-config/master/coredeps.sh | bash

# set ZSH as the default shell for your account
chsh -s /path/to/zsh
```

## List of planned changes

- [x] Make a post on reddit
  - This lets people critisize the hell out of this config
    (constructive criticism) so I can make it an even better config
- [x] Make user overrides completely separate from the core config
  - This means having all user override files in their own folder
    - Implementation is a user_defs folder (see the User Definitions
      documentation)
- [x] Enable user-defined aliases
- [ ] Make platform dependencies less of an issue (nice to have)
  - Things like `apt-get` for example

## Documentation

- [User Definitions](./docs/userdefs.MD)
- [Script Load Order](./docs/loadorder.MD)
