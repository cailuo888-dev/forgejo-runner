#!/bin/bash
set -e
mkdir -p /tmp/runner
cat > /tmp/runner/config.yml <<'CFG'
log:
  level: info
runner:
  name: ${FORGEJO_RUNNER_NAME:-blitz-runner}
  capacity: 1
  timeout: 3h
  shutdown_timeout: 0s
  insecure: false
  fetch_timeout: 5s
  fetch_interval: 2s
  labels:
    - "ubuntu-latest:host://-self-hosted"
container:
  network: ""
  privileged: false
  options:
  valid_volumes: []
host:
  workdir_parent: /tmp/runner/work
CFG
forgejo-runner register \
  --no-interactive \
  --instance "${FORGEJO_URL}" \
  --token "${FORGEJO_RUNNER_TOKEN}" \
  --name "${FORGEJO_RUNNER_NAME:-blitz-runner}" \
  --labels "ubuntu-latest:host://-self-hosted" \
  --config /tmp/runner/config.yml
exec forgejo-runner daemon --config /tmp/runner/config.yml
