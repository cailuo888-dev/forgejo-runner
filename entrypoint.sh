#!/bin/bash
set -e
# 注册并启动 runner
forgejo-runner register \
  --no-interactive \
  --instance "${FORGEJO_URL}" \
  --token "${FORGEJO_RUNNER_TOKEN}" \
  --name "${FORGEJO_RUNNER_NAME:-blitz-runner}" \
  --labels "ubuntu-latest:docker://node:20-bookworm"
# 启动 daemon
exec forgejo-runner daemon
