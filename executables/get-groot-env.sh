#!/usr/bin/env bash
set -euo pipefail

registry_username="$(lpass show 'Shared-Garden/cf-garden-docker' --username)"
registry_password="$(lpass show 'Shared-Garden/cf-garden-docker' --password)"
private_docker_image_url=docker://cfgarden/private:groot

cat <<EOF
export REGISTRY_USERNAME=${registry_username}
export REGISTRY_PASSWORD=${registry_password}
export PRIVATE_DOCKER_IMAGE_URL=${private_docker_image_url}
EOF
