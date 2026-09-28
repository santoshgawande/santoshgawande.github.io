#!/usr/bin/env bash
# ==============================================================================
# santoshgawande.github.io — Verify
# ==============================================================================
# Single verification command for santoshgawande.github.io
# Validates that all entrypoints redirect cleanly to https://santoshgawande.com/
# ==============================================================================

set -euo pipefail

cd "$(dirname "$0")"

GREEN='\033[0;32m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}[1/3] Verifying redirect configuration...${NC}"
for f in "index.html" "404.html"; do
    if [ ! -f "$f" ]; then
        echo -e "  ${RED}✗ Missing required redirect page: $f${NC}"
        exit 1
    fi
    if ! grep -q "https://santoshgawande.com/" "$f"; then
        echo -e "  ${RED}✗ $f does not contain redirect target https://santoshgawande.com/${NC}"
        exit 1
    fi
    echo -e "  ${GREEN}✓ $f redirects to https://santoshgawande.com/${NC}"
done

echo -e "\n${BOLD}[2/3] Checking .nojekyll flag...${NC}"
if [ ! -f ".nojekyll" ]; then
    echo -e "  ${RED}✗ Missing .nojekyll file (needed for direct static serving)${NC}"
    exit 1
fi
echo -e "  ${GREEN}✓ .nojekyll is present.${NC}"

echo -e "\n${BOLD}[3/3] Checking _config.yml for placeholder text...${NC}"
if grep -q "Write an awesome description" _config.yml 2>/dev/null; then
    echo -e "  ${RED}✗ _config.yml still contains placeholder minima text${NC}"
    exit 1
fi
echo -e "  ${GREEN}✓ _config.yml is clean.${NC}"

echo -e "\n${GREEN}${BOLD}✓ VERIFY PASSED${NC}"
