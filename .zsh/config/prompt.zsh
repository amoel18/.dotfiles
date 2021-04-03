#     # Prompt theme.
#     #prompt pure
#     prompt_newline='%666v'
#
#     # Prompt styles.
#     #zstyle :prompt:pure:prompt:error color 1
#     #zstyle :prompt:pure:prompt:success color 15
#     #PURE_PROMPT_VICMD_SYMBOL=""
#     # PURE_PROMPT_SYMBOL=" "
#
#     #PURE_PROMPT_SYMBOL=" "
#
#     # https://github.com/jackharrisonsherlock/common
#
#     # Prompt symbol
#     COMMON_PROMPT_SYMBOL="❯"
#
#     #PROMPT='%F{green}%*%f:%F{blue}%~%f %% '
#
#     # Colors
#     COMMON_COLORS_HOST_ME=green
#     COMMON_COLORS_HOST_AWS_VAULT=yellow
#     COMMON_COLORS_CURRENT_DIR=blue
#     COMMON_COLORS_RETURN_STATUS_TRUE=magenta
#     COMMON_COLORS_RETURN_STATUS_FALSE=yellow
#     COMMON_COLORS_GIT_STATUS_DEFAULT=green
#     COMMON_COLORS_GIT_STATUS_STAGED=red
#     COMMON_COLORS_GIT_STATUS_UNSTAGED=yellow
#     COMMON_COLORS_GIT_PROMPT_SHA=green
#     COMMON_COLORS_BG_JOBS=yellow
#
#     # Left Prompt
#     # PROMPT='$(common_host)${(%):-%~} $(common_return_status)'
#
#
#     PROMPT=" $PROMPT"
#
#     #PROMPT=${PROMPT/\%c/\%~}
#     # Right Prompt
#      RPROMPT='$(common_git_status)'
#
#     # Prompt with current SHA
#     # PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'
#     # RPROMPT='$(common_git_status) $(git_prompt_short_sha)'
#
#     # Host
#     common_host() {
#       if [[ -n $SSH_CONNECTION ]]; then
#         me="%n@%m"
#       elif [[ $LOGNAME != $USER ]]; then
#         me="%n"
#       fi
#       if [[ -n $me ]]; then
#         echo "%{$fg[$COMMON_COLORS_HOST_ME]%}$me%{$reset_color%}:"
#       fi
#       if [[ $AWS_VAULT ]]; then
#         echo "%{$fg[$COMMON_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
#       fi
#     }
#
#     # Current directory
#     common_current_dir() {
#       echo -n "%{$fg[$COMMON_COLORS_CURRENT_DIR]%}%c "
#     }
#
#     # Prompt symbol
#     common_return_status() {
#       echo -n "%(?.%F{$COMMON_COLORS_RETURN_STATUS_TRUE}.%F{$COMMON_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f "
#     }
#
#     # Git status
#     common_git_status() {
#         local message=""
#         local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"
#
#         # https://git-scm.com/docs/git-status#_short_format
#         local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
#         local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")
#
#         if [[ -n ${staged} ]]; then
#             message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
#         elif [[ -n ${unstaged} ]]; then
#             message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
#         fi
#
#         local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
#         if [[ -n ${branch} ]]; then
#             message+="${message_color}${branch}%f"
#         fi
#
#         echo -n "${message}"
#     }
#
#     # Git prompt SHA
#     ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$COMMON_COLORS_GIT_PROMPT_SHA}%}"
#     ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "
#
#     # Background Jobs
#     #common_bg_jobs() {
#       #bg_status="%{$fg[$COMMON_COLORS_BG_JOBS]%}%(1j.↓%j .)"
#       #echo -n $#bg_status
# #}
# #
# #
# # Sobole ZSH Theme
# #
# # Author: Nikita Sobolev, github.com/sobolevn
# # License: WTFPL
# # https://github.com/sobolevn/sobole-zsh-theme
#
# # ----------------------------------------------------------------------------
# # PROMPT settings
# # These settings changes how your terminal prompt looks like
# # ----------------------------------------------------------------------------
#
# if [[ "$USER" == "root" ]]; then
# CARETCOLOR="red"
# elif [[ "$SOBOLE_THEME_MODE" == "dark" ]]; then
# CARETCOLOR="white"
# else
# CARETCOLOR="black"
# fi
#
# PROMPT2='. '
#
# _return_status="%(?..%{$fg[red]%}%? ⚠️%{$reset_color%})"
#
#
# function current_caret {
# # This function sets caret color and sign
# # based on theme and privileges.
# if [[ "$USER" == "root" ]]; then
#   CARET_COLOR="red"
#   CARET_SIGN="$"
# else
#   CARET_SIGN="%"
#
#   if [[ "$SOBOLE_THEME_MODE" == "dark" ]]; then
#     CARET_COLOR="white"
#   else
#     CARET_COLOR="black"
#   fi
# fi
#
# echo "%{$fg[$CARET_COLOR]%}$CARET_SIGN%{$reset_color%}"
# }
#
# PROMPT='%n@%m%#:%F{blue}% ❯ % '
# function current_dir {
# # Settings up current directory and settings max width for it:
# local _max_pwd_length="65"
# local color
#
# if [[ "$SOBOLE_THEME_MODE" == "dark" ]]; then
#   color="white"
# else
#   color="blue"
# fi
#
# if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
#   echo "%{$fg_bold[$color]%}%-2~ ... %3~%{$reset_color%} "
# else
#   echo "%{$fg_bold[$color]%}%~%{$reset_color%} "
# fi
# }
#
# function user_info {
# # Shows user in the PROMPT if needed.
# if [[ ! -z "$SOBOLE_DEFAULT_USER" ]] &&
#     [[ "$USER" != "$SOBOLE_DEFAULT_USER" ]]; then
#   # This only works if `$SOBOLE_DEFAULT_USER` is not empty.
#   # So, when you log in as other user, using `su` for example,
#   # your shell tells you who you are. Otherwise it stays silent.
#   # You should set `$SOBOLE_DEFAULT_USER` somewhere in your `.zshrc`:
#   echo "@$USER "
# fi
# }
#
# # ----------------------------------------------------------------------------
# # virtualenv settings
# # These settings changes how virtualenv is displayed.
# # ----------------------------------------------------------------------------
#
# # Disable the standard prompt:
# export VIRTUAL_ENV_DISABLE_PROMPT=1
#
# function current_venv {
# if [[ ! -z "$VIRTUAL_ENV" ]]; then
#   # Show this info only if virtualenv is activated:
#   local dir=$(basename "$VIRTUAL_ENV")
#   echo "($dir) "
# fi
# }
#
# # ----------------------------------------------------------------------------
# # VCS specific colors and icons
# # These settings defines how icons and text is displayed for
# # vcs-related stuff. We support only `git`.
# # ----------------------------------------------------------------------------
#
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
#
# # ----------------------------------------------------------------------------
# # `ls` colors
# # Made with: http://geoff.greer.fm/lscolors/
# # ----------------------------------------------------------------------------
#
# # if [[ "$SOBOLE_THEME_MODE" == "dark" ]]; then
# # export LSCOLORS="gxfxcxdxbxegedabagacad"
# # export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# # else
# # export LSCOLORS="exfxcxdxBxegedabagacab"
# # export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;41"
# # fi
# #
# # Turns on colors with default unix `ls` command:
# export CLICOLOR=1
#
# # ----------------------------------------------------------------------------
# # `grep` colors and options
# # ----------------------------------------------------------------------------
#
# export GREP_COLOR='1;35'
#
# # ----------------------------------------------------------------------------
# # `zstyle` colors
# # Internal zsh styles: completions, suggestions, etc
# # ----------------------------------------------------------------------------
#
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:descriptions' format "%B--- %d%b"
#
# # ----------------------------------------------------------------------------
# # zsh-syntax-highlighting tweaks
# # This setting works only unless `$SOBOLE_DONOTTOUCH_HIGHLIGHTING`
# # is set. Any value is fine. For exmaple, you can set it to `true`.
# # Anyway, it will only take effect if `zsh-syntax-highlighting`
# # is installed, otherwise it does nothing.
# # ----------------------------------------------------------------------------
#
# if [[ -z "$SOBOLE_DONOTTOUCH_HIGHLIGHTING" ]]; then
# typeset -A ZSH_HIGHLIGHT_STYLES
#
# # Disable strings highlighting:
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='none'
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='none'
#
# if [[ "$SOBOLE_THEME_MODE" == "dark" ]]; then
#   ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
# fi
# fi
#
# Add prompt to fpath.
if [[ -d ".zsh/plugins/pure" ]] {
	fpath=($fpath ".zsh/plugins/pure")
} else {
	return 1
}

# Initialize the prompt system.
promptinit

# Colors


# Prompt theme.
prompt pure
prompt_newline='%666v'
# set newline variable to be used in the prompt
NEWLINE=$'\n'
# set prompt
#PROMPT='${ret_status}%{$fg_bold[green]%}%p %@ %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}${NEWLINE}» '

# Prompt styles.
PURE_PROMPT_VICMD_SYMBOL=" "
# PURE_PROMPT_SYMBOL=" "
PURE_PROMPT_SYMBOL=" x)"
# Left Prompt

# Right Prompt
# Prompt with current SHA
# PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'
# RPROMPT='$(common_git_status) $(git_prompt_short_sha)'

# Host
# set pure_color_success 6638F0 --italics
# set pure_color_ssh_user_root pure_color_dark
# # Current directory
# set pure_reverse_prompt_symbol_in_vimode true
# set pure_begin_prompt_with_current_directory ture
set pure_color_success 6638F0 --italics
set pure_color_ssh_user_root=pure_color_dark
set pure_color_primary = dark
set pure_color_info = white
set pure_reverse_prompt_symbol_in_vimode=true
set pure_begin_prompt_with_current_directory=ture

# Git status


# Git prompt SHA
#ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$COMMON_COLORS_GIT_PROMPT_SHA}%}"
#ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

# Background Jobs
set -U pure_enable_git false

