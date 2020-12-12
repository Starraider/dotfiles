# Homebrew completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Python env manager
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sven/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions git-flow-completion docker z osx)

source $ZSH/oh-my-zsh.sh
. $HOME/.zsh/z.sh

# User configuration

# Hidden files on top
export LC_COLLATE="C"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# zsh-completions

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# nnn configuration

export EDITOR='mcedit'

export NNN_COLORS='6532'
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_PLUG='f:fd;o:fzopen;d:diffs;v:imgview'
export NNN_BMS='d:~/Documents;p:~/Documents/Projekte/;D:~/Downloads/;u:~/;.:~/dotfiles/'

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export LS_COLORS="*.typoscript=33:fi=37"
export EXA_COLORS="uu=36:gu=36:un=35:gn=35"

alias dir='exa --header --long --all --git --group --icons -F --group-directories-first --color-scale --ignore-glob=".git|.DS_Store"'
alias ls='exa --all --icons -F --group-directories-first --ignore-glob=".git|.DS_Store"'
alias typoscript-lint="$HOME/.composer/vendor/bin/typoscript-lint"
alias 'vsc="/Applications/Visual Studio Code - Insiders.app//Contents/Resources/app/bin/code"' 
alias vsc-extensions="vsc --list-extensions | xargs -L 1 echo vsc --install-extension"
alias mc=". /usr/local/Cellar/midnight-commander/4.8.24/libexec/mc/mc-wrapper.sh"
alias backstop='docker run --rm -it -v $(pwd):/src backstopjs/backstopjs "$@" --config backstop.js'
alias vi='nvim'

DEFAULT_USER=$(whoami)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



source /Users/sven/.config/broot/launcher/bash/br


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# jenv
export JENV_ROOT=/usr/local/opt/jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

__zic_fzf_prog() {
  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ] \
    && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

__zic_matched_subdir_list() {
  local dir length seg starts_with_dir
  if [[ "$1" == */ ]]; then
    dir="$1"
    if [[ "$dir" != / ]]; then
      dir="${dir: : -1}"
    fi
    length=$(echo -n "$dir" | wc -c)
    if [ "$dir" = "/" ]; then
      length=0
    fi
    find -L "$dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null \
        | cut -b $(( ${length} + 2 ))- | command sed '/^$/d' | while read -r line; do
      if [[ "${line[1]}" == "." ]]; then
        continue
      fi
      echo "$line"
    done
  else
    dir=$(dirname -- "$1")
    length=$(echo -n "$dir" | wc -c)
    if [ "$dir" = "/" ]; then
      length=0
    fi
    seg=$(basename -- "$1")
    starts_with_dir=$( \
      find -L "$dir" -mindepth 1 -maxdepth 1 -type d \
          2>/dev/null | cut -b $(( ${length} + 2 ))- | command sed '/^$/d' \
          | while read -r line; do
        if [[ "${seg[1]}" != "." && "${line[1]}" == "." ]]; then
          continue
        fi
        if [[ "$line" == "$seg"* ]]; then
          echo "$line"
        fi
      done
    )
    if [ -n "$starts_with_dir" ]; then
      echo "$starts_with_dir"
    else
      find -L "$dir" -mindepth 1 -maxdepth 1 -type d \
          2>/dev/null | cut -b $(( ${length} + 2 ))- | command sed '/^$/d' \
          | while read -r line; do
        if [[ "${seg[1]}" != "." && "${line[1]}" == "." ]]; then
          continue
        fi
        if [[ "$line" == *"$seg"* ]]; then
          echo "$line"
        fi
      done
    fi
  fi
}

__zic_fzf_bindings() {
  autoload is-at-least
  fzf=$(__zic_fzf_prog)

  if $(is-at-least '0.21.0' $(${fzf} --version)); then
    echo 'shift-tab:up,tab:down,bspace:backward-delete-char/eof'
  else
    echo 'shift-tab:up,tab:down'
  fi
}

_zic_list_generator() {
  __zic_matched_subdir_list "${(Q)@[-1]}" | sort
}

_zic_complete() {
  setopt localoptions nonomatch
  local l matches fzf tokens base

  l=$(_zic_list_generator $@)

  if [ -z "$l" ]; then
    zle ${__zic_default_completion:-expand-or-complete}
    return
  fi

  fzf=$(__zic_fzf_prog)
  fzf_bindings=$(__zic_fzf_bindings)

  if [ $(echo $l | wc -l) -eq 1 ]; then
    matches=${(q)l}
  else
    matches=$(echo $l \
        | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} \
          --reverse $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS \
          --bind '${fzf_bindings}'" ${=fzf} \
        | while read -r item; do
      echo -n "${(q)item} "
    done)
  fi

  matches=${matches% }
  if [ -n "$matches" ]; then
    tokens=(${(z)LBUFFER})
    base="${(Q)@[-1]}"
    if [[ "$base" != */ ]]; then
      if [[ "$base" == */* ]]; then
        base="$(dirname -- "$base")"
        if [[ ${base[-1]} != / ]]; then
          base="$base/"
        fi
      else
        base=""
      fi
    fi
    LBUFFER="${tokens[1]} "
    if [ -n "$base" ]; then
      base="${(q)base}"
      if [ "${tokens[2][1]}" = "~" ]; then
        base="${base/#$HOME/~}"
      fi
      LBUFFER="${LBUFFER}${base}"
    fi
    LBUFFER="${LBUFFER}${matches}/"
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
}

zic-completion() {
  setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
  local tokens cmd

  tokens=(${(z)LBUFFER})
  cmd=${tokens[1]}

  if [[ "$LBUFFER" =~ "^\ *cd$" ]]; then
    zle ${__zic_default_completion:-expand-or-complete}
  elif [ "$cmd" = cd ]; then
    _zic_complete ${tokens[2,${#tokens}]/#\~/$HOME}
  else
    zle ${__zic_default_completion:-expand-or-complete}
  fi
}

[ -z "$__zic_default_completion" ] && {
  binding=$(bindkey '^I')
  # $binding[(s: :w)2]
  # The command substitution and following word splitting to determine the
  # default zle widget for ^I formerly only works if the IFS parameter contains
  # a space via $binding[(w)2]. Now it specifically splits at spaces, regardless
  # of IFS.
  [[ $binding =~ 'undefined-key' ]] || __zic_default_completion=$binding[(s: :w)2]
  unset binding
}

zle -N zic-completion
if [ -z $zic_custom_binding ]; then
  zic_custom_binding='^I'
fi
bindkey "${zic_custom_binding}" zic-completion
