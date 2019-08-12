## Everything related to user profile goes here.
# TODO decouple shell theme from luan/vimfiles
source $HOME/.vim/scripts/base16-shell/scripts/base16-monokai.sh

eval "$(fasd --init auto)"
eval "$(direnv hook bash)"

# Alias
if [ $(uname) == "Darwin" ]; then
  alias vim='GOOS=linux CGO_ENABLED=0 nvim'
else
  alias vim='GOOS=linux nvim'
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
