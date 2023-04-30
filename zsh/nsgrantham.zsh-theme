# nsgrantham.zsh-theme

# prompt configuration required to recognize virtualenvs managed by pyenv
# https://askubuntu.com/a/387098

export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtualenv_info

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

PROMPT="
%{$terminfo[bold]$fg[white]%}${current_dir}%{$reset_color%} ${git_info}%(1V.%{$fg[black]%}(%1v)%{$reset_color%}.) 
%{$terminfo[bold]$fg[white]%}› %{$reset_color%}"
