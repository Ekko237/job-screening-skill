#!/usr/bin/env bash
# 把 job-screening 装到本机的 Codex / Claude Code。
# 用法：bash install.sh        （自动检测装到哪个）
#       bash install.sh codex  （只装 Codex）
#       bash install.sh claude （只装 Claude Code）
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGETS=()

case "${1:-auto}" in
  codex)  TARGETS=("$HOME/.codex/skills/job-screening") ;;
  claude) TARGETS=("$HOME/.claude/skills/job-screening") ;;
  auto)
    [ -d "$HOME/.codex" ]  && TARGETS+=("$HOME/.codex/skills/job-screening")
    [ -d "$HOME/.claude" ] && TARGETS+=("$HOME/.claude/skills/job-screening")
    ;;
  *) echo "用法: bash install.sh [codex|claude]"; exit 1 ;;
esac

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "没找到 ~/.codex 或 ~/.claude —— 先装 Codex 或 Claude Code 再跑这个脚本。"
  exit 1
fi

for DST in "${TARGETS[@]}"; do
  mkdir -p "$DST"
  # profile/ 是本机的个人档案，绝不覆盖
  rsync -a --delete \
    --exclude '.git' --exclude 'profile' --exclude 'install.sh' --exclude '.DS_Store' \
    "$SRC"/ "$DST"/
  mkdir -p "$DST/profile"
  echo "✅ 已安装到 $DST"
done

echo
echo "打开 Codex 或 Claude Code，说一句「帮我筛一下秋招岗位」就会触发。"
echo "第一次用它会问你要简历，走一遍建档（约 10 分钟），之后每次直接丢岗位列表就行。"
