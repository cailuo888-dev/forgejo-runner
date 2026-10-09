#!/bin/bash
set -e
forgejo-runner register --no-interactive --instance "${FORGEJO_URL}" --token "${FORGEJO_RUNNER_TOKEN}" --name "${FORGEJO_RUNNER_NAME:-blitz-runner}" --labels "ubuntu-latest"
exec forgejo-runner daemon
