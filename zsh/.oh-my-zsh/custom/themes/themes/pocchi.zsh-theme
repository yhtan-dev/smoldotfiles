# pocchi.zsh-theme

# Borrowing shamelessly from these oh-my-zsh themes:
#   fino-time
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $CONDA_DEFAULT_ENV ] && echo "($CONDA_DEFAULT_ENV) "
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

local c_user="%{$FG[039]%}"      # Deep Sky Blue
local c_host="%{$FG[075]%}"      # Steel / Soft Blue
local c_path="%{$FG[141]%}"      # Bright Lavender / Purple
local c_date="%{$FG[099]%}"      # Soft Purple / Violet
local c_muted="%{$FG[061]%}"     # Muted Slate Blue (for 'at', 'in', etc.)

local c_git_branch="%{$fg[255]%}" # Bright White
local c_git_dirty="%{$FG[196]%}"  # Crimson Red
local c_git_clean="%{$FG[033]%}"  # Bright Cyan-Blue

local c_ruby="%{$FG[170]%}"       # Magenta / Orchid
local c_reset="%{$reset_color%}"
local c_bold="%{$terminfo[bold]%}"

PROMPT="╭["\
"${c_user}%n${c_reset}"\
"${c_muted}@${c_reset}"\
"${c_host}$(box_name)${c_reset}]"\
"\$(git_prompt_info)"\
"\$(ruby_prompt_info)"\
"「${c_date}%*${c_reset}」"\
$'\n'\
"├‹${c_bold}${c_path}%~${c_reset}›"\
$'\n'\
"╰─"\
"$(virtualenv_info)\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" ${c_muted}«${c_reset}${c_git_branch}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${c_muted}»${c_reset}"
ZSH_THEME_GIT_PROMPT_DIRTY="${c_git_dirty}✕"
ZSH_THEME_GIT_PROMPT_CLEAN="${c_git_clean}√"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${c_muted}using${c_reset}${c_ruby} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›${c_reset}"
