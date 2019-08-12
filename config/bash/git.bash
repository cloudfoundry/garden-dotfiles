## Everything related to git goes here.

# Environment Variables
export GIT_DUET_GLOBAL=true
export GIT_DUET_CO_AUTHORED_BY=1
export GIT_DUET_ROTATE_AUTHOR=1

# Git aliases
alias git="LANG=en_GB git"
alias duet='git duet --global'
alias gap="git add -p"
alias gp="git push"
alias gst='git status'
alias gsu="git submodule update --init --recursive"
alias gup="git pull --rebase"
alias gpr="git pull --rebase"
alias solo='git solo --global'
alias gti='git'

## Custom Functions

# Add committer initials to the git prompt info
# TODO can this be simplified by using a plugin instead?
function git_prompt_info {
  git_prompt_vars
  GIT_DUET_INITIALS=$(echo $(git config --get-regexp ^duet.env.git-.*-name | sed -e 's/^.*-name //' | tr 'A-Z' 'a-z' | sed -e 's/\([a-z]\)[^ +]*./\1/g' ) | sed -e 's/ /+/')
  GIT_PAIR=${GIT_DUET_INITIALS:-`git config user.initials | sed 's% %+%'`}
  echo -e " $GIT_PAIR$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}
