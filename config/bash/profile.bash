## Everything related to user profile goes here.

eval "$(fasd --init auto)"
eval "$(direnv hook bash)"

# Alias
alias vim='GOOS=linux CGO_ENABLED=0 nvim'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
