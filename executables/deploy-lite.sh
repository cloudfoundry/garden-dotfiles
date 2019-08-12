#!/usr/bin/env bash
set -euo pipefail

base_dir=~/workspace/bosh-vbox

mkdir -p "$base_dir"

BOSH_ACTION=${BOSH_ACTION:-create}

bosh "${BOSH_ACTION}-env" ~/workspace/bosh-deployment/bosh.yml \
  --state "${base_dir}/state.json" \
  -o ~/workspace/bosh-deployment/virtualbox/cpi.yml \
  -o ~/workspace/bosh-deployment/virtualbox/outbound-network.yml \
  -o ~/workspace/bosh-deployment/bosh-lite.yml \
  -o ~/workspace/bosh-deployment/bosh-lite-runc.yml \
  -o ~/workspace/bosh-deployment/jumpbox-user.yml \
  --vars-store "${base_dir}/creds.yml" \
  -v director_name="Bosh Lite Director" \
  -v internal_ip=192.168.50.6 \
  -v internal_gw=192.168.50.1 \
  -v internal_cidr=192.168.50.0/24 \
  -v outbound_network_name=NatNetwork \
  "$@"

if [ "$BOSH_ACTION" = create ]; then
  cat > "${base_dir}/bosh-env" << EOF
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=$( bosh int ${base_dir}/creds.yml --path /admin_password )
export BOSH_CA_CERT="$( bosh int "${base_dir}/creds.yml" --path /director_ssl/ca )"
export BOSH_ENVIRONMENT=192.168.50.6
unset BOSH_GW_HOST
EOF

  echo "now run:"
  echo "1. source ${base_dir}/bosh-env"
  echo "2. route add -net 10.244.0.0/16 192.168.50.6"
fi
