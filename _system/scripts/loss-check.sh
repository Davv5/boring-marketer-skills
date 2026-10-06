#!/usr/bin/env bash
# Warn about base-ref section bodies no longer found anywhere in the current
# skill/_system markdown. Whitespace/markdown decoration and heading names are
# ignored; identical relocated substance is retained. Warnings are review leads,
# not proof of loss. Run from a git pack: BASE_REF=<ref> bash loss-check.sh.
# Requires python3; unavailable history/tools only warn. This check never fails.
set -u
BASE_REF="${BASE_REF:-origin/main}"
PACK_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
  echo 'Warning: loss check needs a git checkout; skipped.'
  exit 0
}
if ! python3 - "$PACK_ROOT" "$BASE_REF" <<'PY'
import re
import subprocess
import sys
from pathlib import Path

root = Path(sys.argv[1])
base = sys.argv[2]


def git(*args):
    return subprocess.check_output(['git', '-C', str(root), *args], stderr=subprocess.DEVNULL).decode('utf-8')


try:
    paths = git('ls-tree', '-r', '--name-only', base).splitlines()
except subprocess.CalledProcessError:
    print(f'Warning: cannot read base ref {base}; loss check skipped.')
    sys.exit(0)

base_skills = {p.split('/')[0] for p in paths if p.count('/') == 1 and p.endswith('/SKILL.md')}
base_files = [p for p in paths if p.endswith('.md') and
              (p.startswith('_system/') or p.split('/')[0] in base_skills)]
current_dirs = [root / '_system', *(p.parent for p in root.glob('*/SKILL.md'))]


def sections(text):
    """ATX section own bodies, not descendant bodies; fenced headings are text."""
    heading = None
    body = []
    fence = None
    frontmatter = False
    for i, line in enumerate(text.splitlines()):
        if i == 0 and line.strip() == '---':
            frontmatter = True
            continue
        if frontmatter:
            if line.strip() == '---':
                frontmatter = False
            continue
        marker = re.match(r'^\s{0,3}(`{3,}|~{3,})', line)
        if marker:
            token = marker[1]
            if fence is None:
                fence = token
            elif token[0] == fence[0] and len(token) >= len(fence):
                fence = None
        match = re.match(r'^#{1,6}\s+(.+?)\s*#*\s*$', line) if fence is None and not marker else None
        if match:
            yield heading, '\n'.join(body)
            heading = match[1]
            body = []
        else:
            body.append(line)
    yield heading, '\n'.join(body)


def normalize(text):
    text = re.sub(r'<!--.*?-->', '', text, flags=re.S)
    text = re.sub(r'[`*_]', '', text)
    return ' '.join(text.split())


# Search each complete current file, with heading lines omitted, so moving a
# section into several differently headed sections does not look like deletion.
current = []
for directory in current_dirs:
    for file in sorted(directory.rglob('*.md')):
        if any(part.startswith('.') for part in file.relative_to(root).parts):
            continue
        text = file.read_text(encoding='utf-8')
        # Retain preamble too: a relocated body need not have its own heading.
        current.append(normalize('\n'.join(body for _, body in sections(text))))

warnings = 0
for path in base_files:
    for heading, body in sections(git('show', f'{base}:{path}')):
        body = normalize(body)
        if heading is not None and body and not any(body in text for text in current):
            print(f'MISSING  {path} :: {heading}')
            warnings += 1
print(f'Loss check: {warnings} warnings against {base} (review only).')
PY
then
  echo 'Warning: loss check could not complete; review manually.'
fi
exit 0
