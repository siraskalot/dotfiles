export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

eval "$(rbenv init - --no-rehash)"

# DESCRIPTION:
#   A simple zsh configuration that gives you 90% of the useful features that I use everyday.
#
# AUTHOR:
#   Geoffrey Grosenbach http://peepcode.com

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}⚡%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

# Replace the above with this if you use rbenv
RPROMPT='%{$fg[white]%} $(rbenv version-name)$(~/bin/git-cwd-info)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# vi mode
bindkey -v

# search history
bindkey -M vicmd '/' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward

alias tmux="TERM=screen-256color-bce tmux -u"
alias ls="ls -G"
alias ..="cd .."
alias ...="cd ../.."
alias lunch="harp server & browser-sync start --proxy 'localhost:9000'"
alias brunch="harp compile -o dist && divshot push"
alias deldstore="find . -type f -name ".DS_Store" -exec rm -rf {} \;"
alias gdf="git diff --word-diff --color-words"

#usage -> slackbot [channel] ["message"]

function slackbot() {
  hookurl="https://vaavaa.slack.com/services/hooks/slackbot?token=qZqjlwn6BCoOtsSkL2psqXB0&channel=%23"
  curl --data $2 $hookurl$1
}

function cpr() {
  cp -Rva $1 $2
}

function cprd() {
  cp -Rva $1 ~/Desktop
}

function agh() {
  ag $1 *
}

function dash() {
  open "dash://$1"
}

# Shell history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=900000 # This value is smaller than HISTSIZE to allow a window for dupes.
setopt append_history # Append to the history file rather than replacing it.
setopt inc_append_history # Write history items as they are run, not on shell exit.
setopt hist_expire_dups_first # Expire duplicate history items before older unique ones.
setopt hist_ignore_dups # Don't save consecutive duplicate history items.

# Misc zsh config
setopt notify # Print background job status immediately.
unsetopt auto_cd # Don't "execute" directories by changing into them.
unsetopt MULTIOS #https://robots.thoughtbot.com/input-output-redirection-in-the-shell

# Move between (customised) words with option-left/right.
export WORDCHARS='*?[]~=&;!#$%^(){}'
bindkey "\e\e[C"  forward-word
bindkey "\e\e[D"  backward-word

# Auto-jump to directories
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

eval "$(rbenv init - --no-rehash zsh)"

# recommended by brew doctor
