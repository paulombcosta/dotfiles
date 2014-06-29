# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nebirhos"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew mvn npm node web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Vim as default editor
export EDITOR='vim'

# Setting zsrch vim mode
set -o vi

# Java & Android config
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export GRADLE_HOME=$HOME/Programs/gradle-1.11
export SMALI=$HOME/Programs/dextools/smali
export BAKSMALI=$HOME/Programs/dextools/baksmali

# Golang config
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GVM_ROOT=$HOME/.gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Setting path variables
PATH=$PATH:$HOME/.rvm/bin:$GVM_ROOT:$GRADLE_HOME/bin:$SMALI
export PATH="/opt/local/bin:/opt/local/sbin:/Users/paulocosta/android-sdks/tools:/Users/paulocosta/android-sdks/platform-tools:/Users/paulocosta/Programs/gradle-1.10/bin:/Users/paulocosta/.rvm/gems/ruby-1.9.3-p392/bin:/Users/paulocosta/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/paulocosta/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/paulocosta/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/go/bin:/Users/paulocosta/go/bin:/etc/sonarqube/bin/macosx-universal-64"

# Projects shortcuts
export PROJECTS=$HOME/Projetos
export GM_G=$PROJECTS/greenmile/gm-driver-android-gradle/gm-driver-android/greenmile-android
export GM_M=$PROJECTS/greenmile/gm-driver-android/greenmile-android
export SEER=$PROJECTS/personal/seer

# Vim's gruvbox
~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
