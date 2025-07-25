ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  if [ -n "$ZLM_DISABLE_GIT_PROMPT" ]; then
    return
  fi

  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT=$' %{$fg[246]%}┌$(git_custom_status)%{$ZLM_PROMPT_COLOR%}[%~% ]%{$reset_color%}%B
 %{$fg[246]%}└%{$fg[007]%}$>%{$reset_color%}%b '
