[ -n "$PS1" ] && source ~/.zsh_profile;

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/sbin:$PATH"
eval "$(fnm env --multi)"
