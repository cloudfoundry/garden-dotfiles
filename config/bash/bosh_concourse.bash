# All sweet bosh-lite and concourse-lite stuff goes here

export GARDEN_REMOTE_ATC_URL=garden-ci
alias prune-workers="fly -t garden-ci workers | grep stalled | awk  '{print \$1}' | xargs -n1 fly -t garden-ci pw -w"
