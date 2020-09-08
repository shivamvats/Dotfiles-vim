#! /bin/zsh

source ~/.zsh_aliases

source ~/antigen.zsh

ZSH_THEME="jreese"
antigen use oh-my-zsh

#################
# Load Plugins
# ###############
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Auto-suggestions
# Hit `End` to use the full suggestion
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
#antigen theme robbyrussell/oh-my-zsh themes/agnoster
#antigen theme robbyrussell/oh-my-zsh themes/jreese
# workaround for https://github.com/zsh-users/antigen/issues/675
#THEME=ys
#antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi

# Tell Antigen that you're done.
antigen apply

################
#Plugins Loaded
################

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt prompt_subst

#PROMPT='%n %3~%(!.#.$)%(?.. [%?]) '
# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}NUM %{$reset_color%}"
  local BEHIND="%{$fg[cyan]%}NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎ %{$reset_color%}"
  local UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
  local MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
  local STAGED="%{$fg[green]%}●%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
      DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
      DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
      FLAGS+=( "$MERGING" )
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
      FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
      FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
      FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "$RED±" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  GIT_INFO+=( "$DARKBLUE$GIT_LOCATION%{$reset_color%}" )
  echo "${(j: :)GIT_INFO}"

}

# Use ❯ as the non-root prompt character; # for root
# Change the prompt character color if the last command had a nonzero exit code
PS1='%{$fg[magenta]%}%~%u $(git_info)
%(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} '

# append to the history file, don't overwrite it
#setopt HIST_IGNORE_DUPS
setopt histignorealldups
# Share history across multiple terminals.
setopt no_share_history

# Vim keybindings
bindkey -v
bindkey '^R' history-incremental-search-backward

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# coloredlogs for python
export COLOREDLOGS_LOG_FORMAT='%(asctime)s %(name)s %(levelname)s- %(message)s'

# Vim commands for the terminal
set editing-mode vi
set keymap vi-command

/usr/bin/setxkbmap -option 'caps:ctrl_modifier'
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 200

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
