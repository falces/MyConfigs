# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
  docker-compose
  ssh-agent
  virtualenv
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases,c overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# PowerLevel Customization
POWERLEVEL9K_DIR_HOME_BACKGROUND='045'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='045'
POWERLEVEL9K_DIR_ETC_BACKGROUND='045'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='045'

POWERLEVEL9K_VIRTUALENV_BACKGROUND="clear"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="cyan"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv pyenv time)
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# PowerLevel Customization

# Antigen Plugin
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/antigen/antigen.zsh

# Autosuggestions Plugin
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export DEFAULT_USER="$(whoami)"

# My Aliases
alias ls="ls -la -G"
alias phpunit="./vendor/phpunit/phpunit/phpunit --color"

alias createnv="python3 -m virtualenv --python=/usr/local/bin/python3 .venv"
alias activatenv="source .venv/bin/activate"
alias deletenv="rm -rf .venv"
alias deactivatenv="deactivate"
alias cleanenv="pip freeze | xargs pip uninstall -y"
alias pipset="pip freeze > requirements.txt"
alias pinstall="pip install -r requirements.txt"
alias du="docker compose -f docker/compose.yaml up --build -d"
alias delcache="find . | grep -E \"(__pycache__|\.pyc|\.pyo$)\" | xargs rm -rf"
alias nsh="docker run -it --rm --entrypoint sh node:24-alpine"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
PATH=$(pyenv root)/shims:$PATH
# EOF Pyenv

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

alias prtemplate="mkdir .github; cp ~/Documents/GIT/plantilla_prs.md .github/pull_request_template.md"

sym()
{
    if [ -f bin/console ]; then
        php bin/console "$@"
    elif [ -f app/console ]; then
        php app/console "$@"
    else
        echo "No estás en un directorio Symfony"
    fi
}

his(){
  history | grep $1
}

vinstall(){
  pip install $1
  pip freeze > requirements.txt
}

dsh(){
  docker exec -it $1 /bin/sh
}

gitconfig(){
  echo -n "Perfil GIT (per / pro):"
  read  profile

  # switch
  case $profile in
    per)
      git config user.email "falces@gmail.com"
      git config user.name "falces"
      git config user.signingKey "WSLfalces"
      ;;
    pro)
      git config user.email "javier.rodriguez@create-store.com"
      git config user.name "javi-rodriguez-create"
      git config user.signingKey "WSLcreate"
      ;;
    # default case: raise error
    *)
      >&2 echo "ERROR: perfil desconocido: $profile"
      exit 1
  esac
}

# SONARQUBE ================================

export PATH="${HOME}/Applications/sonar-scanner/bin":$PATH

SONARQUBE_PATH="${HOME}/Applications/sonarqube/bin/macosx-universal-64/sonar.sh"
SONAR_SCANNER_PATH="${HOME}/Applications/sonar-scanner/bin/sonar-scanner"

sonar_start() {
  ${SONARQUBE_PATH} start
}

sonar_status() {
  ${SONARQUBE_PATH} status
}

sonar_stop() {
  ${SONARQUBE_PATH} stop
}

sonar_cli() {
  ${SONARQUBE_PATH} console
}

sonar_scan() {
  current_dir=$(basename $(pwd))
  echo "current_dir=${current_dir}"

  current_commit=$(git rev-parse --short HEAD)
  echo "current_commit=${current_commit}"

  ${SONAR_SCANNER_PATH} \
  -Dsonar.projectKey=${current_dir} \
  -Dsonar.projectName=${current_dir} \
  -Dsonar.projectVersion=${current_commit} \
  -Dsonar.source=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=$1
}