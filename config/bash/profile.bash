## Everything related to user profile goes here.
# TODO decouple shell theme from luan/vimfiles
source $HOME/.vim/scripts/base16-shell/scripts/base16-monokai.sh

eval "$(fasd --init auto)"
eval "$(direnv hook bash)"

# Alias
alias vim='nvim'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
