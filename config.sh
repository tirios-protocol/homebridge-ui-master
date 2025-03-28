#!/bin/bash
set -euo pipefail

if [ -d ".git" ]; then
  rm -rf .git
fi
git init -b main

declare -a authors=(
"flavioespinoza |  flavio.espinoza@gmail.com | +800"
"christiancm7 |  cmoralestech@gmail.com | -600"
"eedsilva |  eed.silva@hotmail.com | +100"
"miquelTC | miqueltrallero.c@gmail.com | -1100"
"BTCB | admin@github.xyz | +0000"
"MrinalSingh04 | mrinalsingh7000@gmail.com | +800"
"pietromartinso | profpietromartins@gmail.com | +300"
"evg-ch |  evg.ch.dev@gmail.com | -100"
"vanada-cpu |  vasdnas5@gmail.com | +700"
"sedra138 |  sedra.khabbaz@gmail.com | -1100"
"anhhuy007 |  imanhhuy007@gmail.com | +500"
"ohdcthang |  hoducthangtn2nhvt@gmail.com | -300"
"paOol |  paoolkim@gmail.com | +200"
"sebaraba |  rabasebastians@gmail.com | +500"
"sballmer |  ballmer.stephane@gmail.com | -1200"
"gguadiana100 |  gguadiana100@gmail.com | +900"
)

from=1221
to=1

messages=(
  "Refactor logic"
  "Fix bug"
  "Remove Test Option"
  "Optimize gas consumption"
  "Improve 3D rendering performance"
  "Improve dashboard user experience"
  "Enhance property detail page layout"
  "Add wallet connection support"
  "Add property search filters"
  "Add unit tests for API services"
  "Improve page load performance"
  "Clean up code"
  "Organize project structure"
)

config11=(
  # ".gitattributes"
  # ".gitignore"
  # ".nvmrc"
  # ".prettierignore"
  # ".prettierrc"
  # "CONTRIBUTING.md"
  # "LICENSE"
  # "README.md"
  # "START.cmd"
  # "package.json"
)
config18=${#authors[@]}
config23=$((from - to))

IFS='|' read -r config1 config2 config3 <<<"${authors[0]}"
git config user.name "$config1"
git config user.email "$config2"

# --- FUNCTIONS ---

function rrmm() {
  echo "${messages[$RANDOM % ${#messages[@]}]}"
}

function ggtt() {
  gtod=$(($1 + $to))
  local gtz=$2
  gtdd=$(date -d "$gtod days ago" +%Y-%m-%d)
  echo "${gtdd}T12:00:00${gtz}"
}

# Detect image / asset files
function is_binary_asset() {
  [[ "$1" =~ \.(png|jpg|jpeg|svg|ico)$ ]]
}

git config core.autocrlf false

if [[ -f .gitignore ]]; then
  git add .gitignore
else
  exit 1
fi

ddtt=$(ggtt $config23 $config3)

GIT_AUTHOR_NAME="$config1" \
GIT_AUTHOR_EMAIL="$config2" \
GIT_AUTHOR_DATE="$ddtt" \
GIT_COMMITTER_NAME="$config1" \
GIT_COMMITTER_EMAIL="$config2" \
GIT_COMMITTER_DATE="$ddtt" \
git commit -m "Init project"

mapfile -t all_files < <(git ls-files --cached --others --exclude-standard | shuf)

declare -A config50
config50[".gitignore"]=1

for pf in "${config11[@]}"; do
  config50["$pf"]=1
done

config55=()

for config56 in "${all_files[@]}"; do
  if [[ -z "${config50[$config56]:-}" ]]; then
    config55+=("$config56")
  fi
done

config61=("${config11[@]}" "${config55[@]}")
config62=${#config61[@]}
config63=12
config64=$((config62 / config63))
config65=$((config23 / config64))

git checkout -b develop

config67=0
config68=1
config69=1

declare -i config70=0
declare -a config71=()

while [ $config67 -lt ${#config61[@]} ]; do
  config73=$((RANDOM % 6 + 10))
  config74=0

  if ((config67 + config73 > ${#config61[@]})); then
    config73=$((${#config61[@]} - config67))
    config74=1
  fi

  config79=("${config61[@]:config67:config73}")
  config80="feat/$config69"
  config71+=("$config80")

  git checkout develop
  git branch -D "$config80" 2>/dev/null || true
  git checkout -b "$config80"

  if [[ $config74 == 1 ]]; then
    config86=$(git log -1 --format="%aI" develop)
    config87=$(date +%s)
    config88=$(date -d "$config86" +%s)
    config89=$(((config88 - config87) / 86400))
    config90=$((-config89 - $to))
  else
    config90=$((config23 - 1 - (config68 - 1) * config65))
  fi

  config94=$((RANDOM % config18))
  IFS='|' read -r config95 config952 config953 <<<"${authors[$config94]}"

  config70=0

  for config56 in "${config79[@]}"; do
    git add "$config56"

    ctdd=$((config90 - config70))
    ddtt=$(ggtt $ctdd $config953)

    filename="${config56##*/}"

    # --- SMART COMMIT MESSAGE ---
    if is_binary_asset "$config56"; then
      commit_msg="Add $filename"
    else
      commit_msg="$(rrmm) in $filename"
    fi

    GIT_AUTHOR_NAME="$config95" \
    GIT_AUTHOR_EMAIL="$config952" \
    GIT_AUTHOR_DATE="$ddtt" \
    GIT_COMMITTER_NAME="$config95" \
    GIT_COMMITTER_EMAIL="$config952" \
    GIT_COMMITTER_DATE="$ddtt" \
    git commit -m "$commit_msg"

    ((config70++)) || true
  done

  git checkout develop

  config111=$(git log -1 --format="%aI" $config80)

  git merge --no-ff --no-commit $config80

  GIT_AUTHOR_NAME="$config95" \
  GIT_AUTHOR_EMAIL="$config952" \
  GIT_AUTHOR_DATE="$config111" \
  GIT_COMMITTER_NAME="$config95" \
  GIT_COMMITTER_EMAIL="$config952" \
  GIT_COMMITTER_DATE="$config111" \
  git commit -m "Merge into develop"

  ((config67 += config73))
  ((config68++))
  config69=$((config69 + 1))

  if (((config68 - 1) % (RANDOM % 4 + 3) == 0)); then
    git checkout main

    config86=$(git log -1 --format="%aI" develop)

    git merge --no-ff --no-commit develop

    GIT_AUTHOR_NAME="$config1" \
    GIT_AUTHOR_EMAIL="$config2" \
    GIT_AUTHOR_DATE="$config86" \
    GIT_COMMITTER_NAME="$config1" \
    GIT_COMMITTER_EMAIL="$config2" \
    GIT_COMMITTER_DATE="$config86" \
    git commit -m "Merge into main"

    git checkout develop
  fi
done

if [ $(git branch --merged main | grep -c develop) -eq 0 ]; then
  git checkout main

  config86=$(git log -1 --format="%aI" develop)

  git merge --no-ff --no-commit develop

  GIT_AUTHOR_NAME="$config1" \
  GIT_AUTHOR_EMAIL="$config2" \
  GIT_AUTHOR_DATE="$config86" \
  GIT_COMMITTER_NAME="$config1" \
  GIT_COMMITTER_EMAIL="$config2" \
  GIT_COMMITTER_DATE="$config86" \
  git commit -m "Merge into main"
fi