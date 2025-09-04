# zdotdir

> A sample Zsh config using the antidote plugin manager

## Description

This project aims to give you an example Zsh config that uses [antidote] as a plugin manager and pulls some amazing Zsh plugins together. Consider it an example configuration of how to use antidote. Feel free to borrow from it for your own config, or fork it and make it your own.

### What's included

A sample antidote `.zsh_plugins.txt` file that bundles plugins with the following plugin provided features:
- Better Zsh defaults
- [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [History substring searching](https://github.com/zsh-users/zsh-history-substring-search)
- [FZF history search](https://github.com/joshskidmore/zsh-fzf-history-search) - Enhanced fuzzy history searching
- [Syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- <kbd>TAB</kbd> completions
- The popular [Powerlevel10k prompt](https://github.com/romkatv/powerlevel10k)
- A few goodies from [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
- A `functions` directory for lazy-loaded functions
- Lots of [helpful plugins](https://github.com/unixorn/awesome-zsh-plugins)!
- Custom utility functions (see [Custom Functions](#custom-functions) below)
- [direnv](https://direnv.net/) and [fzf](https://github.com/junegunn/fzf) integration
- And much more, all without compromising shell speed :rocket:

### Configuration Structure

This zsh configuration is organized for optimal performance and maintainability:

- **`.zshenv`** - Environment variables and tool installations available globally (both interactive and non-interactive shells)
  - NVM, Conda, Homebrew environment setup
  - PATH modifications and global environment variables
- **`.zshrc.d/`** - Interactive shell features loaded only when needed
  - Aliases, key bindings, and interactive tools (FZF, Zoxide, etc.)
  - Modular organization with descriptive filenames loaded alphabetically

### Custom Functions

This configuration includes several custom Zsh functions located in `.zfunctions/`:

`ssht <hostname>` - Connect to a remote host and automatically attach to (or create) a tmux session called "main".

`sshf <hostname> <port1> [port2] [port3] ...` - Forward one or more local ports to a remote host via SSH tunneling.

`ct <directory>` - Count the number of files in a directory.

## Installation

### Prerequisites
Before installing this configuration, make sure you have the following tools installed:

**Dependencies**
- **[fzf](https://github.com/junegunn/fzf)** - Fuzzy finder for command-line
- **[direnv](https://direnv.net/)** - Environment switcher for the shell
- **[tmux](https://github.com/tmux/tmux)** - Terminal multiplexer (required in the target host for `ssht` function)
- **[MesloLGS NF font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)** - Required for Powerlevel10k prompt icons (can be installed automatically by Powerlevel10k)

**Configuration Notes**  
- If you use Conda, make sure to set the `CONDA_HOME` environment variable in `.zshenv` to point to your Conda installation directory (e.g., `export CONDA_HOME="$HOME/miniforge3"`).
- If you use NVM (Node Version Manager), make sure to set the `NVM_DIR` environment variable in `.zshenv` to point to your NVM installation directory (e.g., `export NVM_DIR="$HOME/.nvm"`).
- **iTerm2 users**: Install the MesloLGS NF font and set it in iTerm2 preferences for both your main profile AND the tmux profile to ensure proper display of Powerlevel10k icons.

### Setup
Clone this project to `$ZDOTDIR`, and then make `~/.zshenv` source `$ZDOTDIR/.zshenv`.

```zsh
# clone this project
ZDOTDIR=~/.config/zsh
git clone https://github.com/patrontheo/zdotdir $ZDOTDIR

# source the .zshenv from ZDOTDIR
[[ -f ~/.zshenv ]] && mv -f ~/.zshenv ~/.zshenv.bak
echo ". $ZDOTDIR/.zshenv" > ~/.zshenv

# start a new zsh session
zsh
```

## Customization

### Prompt Theme
To reconfigure the Powerlevel10k prompt theme, run:
```zsh
p10k configure
```
This will launch an interactive configuration wizard to customize your prompt appearance.

[antidote]: https://getantidote.github.io
