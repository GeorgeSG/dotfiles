override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Georgi"

  GIT_PROMPT_PREFIX="${BoldCyan}("
  GIT_PROMPT_SUFFIX="${BoldCyan})"
  GIT_PROMPT_BRANCH="${BoldCyan}"
  GIT_PROMPT_SEPARATOR="${BoldCyan}|"

  GIT_PROMPT_CHANGED="${BoldRed}+"
  GIT_PROMPT_UNTRACKED="${BoldRed}…"
  GIT_PROMPT_STAGED="${BoldGreen}●"
  GIT_PROMPT_STASHED="${BoldCyan}⚑"
  GIT_PROMPT_CONFLICTS="${BoldRed}✖"
  GIT_PROMPT_CLEAN="${BoldCyan}✔"

  GIT_PROMPT_SYMBOLS_AHEAD="${BoldYellow}↑"
  GIT_PROMPT_SYMBOLS_BEHIND="${BoldMagenta}↓"
  GIT_PROMPT_SYMBOLS_PREHASH="${BoldRed}:"

  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=" "
  GIT_PROMPT_REMOTE=""
}

reload_git_prompt_colors "Georgi"
