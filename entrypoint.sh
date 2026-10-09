#!/bin/bash
set -e
# 轻量 Runner：轮询 Forgejo API，手动触发 workflow
echo "Lightweight runner started"
echo "Forgejo: ${FORGEJO_URL}"
# 保持容器运行，实际任务由 Forgejo 的 webhook 或定时触发
# 这里只做心跳
while true; do
  echo "$(date): heartbeat"
  sleep 60
done
