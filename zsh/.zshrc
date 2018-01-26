# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jwolaver/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME="spaceship"
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
)

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

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

if [[ $ZSH_THEME = 'spaceship' ]]; then
	SPACESHIP_TIME_COLOR="${SPACESHIP_TIME_COLOR:="yellow"}"
	SPACESHIP_USER_COLOR="${SPACESHIP_USER_COLOR:="yellow"}"
	SPACESHIP_USER_COLOR_ROOT="${SPACESHIP_USER_COLOR_ROOT:="red"}"
	SPACESHIP_HOST_COLOR="${SPACESHIP_HOST_COLOR:="green"}"
	SPACESHIP_DIR_COLOR="${SPACESHIP_DIR_COLOR:="black"}"
	SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR:="magenta"}"
	SPACESHIP_GIT_STATUS_COLOR="${SPACESHIP_GIT_STATUS_COLOR:="red"}"
	SPACESHIP_HG_BRANCH_COLOR="${SPACESHIP_HG_BRANCH_COLOR:="magenta"}"
	SPACESHIP_HG_STATUS_COLOR="${SPACESHIP_HG_STATUS_COLOR:="red"}"
	SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR:="red"}"
	SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR:="green"}"
	SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR:="red"}"
	SPACESHIP_ELIXIR_COLOR="${SPACESHIP_ELIXIR_COLOR:="magenta"}"
	SPACESHIP_XCODE_COLOR="${SPACESHIP_XCODE_COLOR:="blue"}"
	SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR:="yellow"}"
	SPACESHIP_GOLANG_COLOR="${SPACESHIP_GOLANG_COLOR:="cyan"}"
	SPACESHIP_PHP_COLOR="${SPACESHIP_PHP_COLOR:="blue"}"
	SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR:="red"}"
	SPACESHIP_HASKELL_COLOR="${SPACESHIP_HASKELL_COLOR:="red"}"
	SPACESHIP_JULIA_COLOR="${SPACESHIP_JULIA_COLOR:="green"}"
	SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR:="cyan"}"
	SPACESHIP_VENV_COLOR="${SPACESHIP_VENV_COLOR:="blue"}"
	SPACESHIP_CONDA_COLOR="${SPACESHIP_CONDA_COLOR:="blue"}"
	SPACESHIP_PYENV_COLOR="${SPACESHIP_PYENV_COLOR:="yellow"}"
	SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR:="128"}"
	SPACESHIP_EMBER_COLOR="${SPACESHIP_EMBER_COLOR:="210"}"
	SPACESHIP_KUBECONTEXT_COLOR="${SPACESHIP_KUBECONTEXT_COLOR:="cyan"}"
	SPACESHIP_EXEC_TIME_COLOR="${SPACESHIP_EXEC_TIME_COLOR:="yellow"}"
	SPACESHIP_VI_MODE_COLOR="${SPACESHIP_VI_MODE_COLOR:="white"}"
	SPACESHIP_JOBS_COLOR="${SPACESHIP_JOBS_COLOR:="blue"}"
	SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR:="red"}"
	SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR:="208"}"
fi

bindkey -v

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"

filesToSource=(
	~/.{functions,aliases,bashenv}
	"${ZSH}/custom/zsh-syntax-highlighting-filetypes.zsh"
)

for fileToSource in "${filesToSource[@]}"; do
	[[ -f "$fileToSource" ]] && source "$fileToSource"
done

eval "$(dircolors -b "${HOME}/.dircolors")"
