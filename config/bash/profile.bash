## Everything related to user profile goes here.
# TODO decouple shell theme from luan/vimfiles

eval "$(fasd --init auto)"
eval "$(direnv hook bash)"

# Alias
alias vim='nvim'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
