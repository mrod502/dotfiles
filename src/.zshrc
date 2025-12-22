# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
alias ls='ls -G'
bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
idk(){
	echo '¯\_(ツ)_/¯'
}

# react-native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/Users/mike/.rbenv/versions/2.7.6/bin:$PATH

export PATH="$PATH:/usr/local/opt/python/libexec/bin"
export PATH=$PATH:$HOME/.cargo/bin
export C_INCLUDE_PATH=/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.8/Headers
alias cdrs='cd $RUST'
alias cdgo='cd $GOPATH'
alias cdjs='cd $CODE/js'
alias cdrb='cd $CODE/rb'
alias gsur='git submodule update --init --recursive'
alias lports='lsof -P -iTCP -sTCP:LISTEN'
alias python=python3
alias hist='cat $HOME/.zsh_history | grep'
alias homeip="curl -k 'https://18.223.236.246:3391/current?apiKey=CanIPleaseHaveTheIpAddress502'"
alias ncargo='cargo +nightly'
alias gadd="git add"

export CODE=$HOME/code
export RUST=$CODE/rs
export DEV_KEY_ANVIL='0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80'
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

setopt PROMPT_SUBST

# bin stuff
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$CODE/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN
#export STARKNET_WALLET='0x2d603768c97c615b4068cb9bf4fd2fc2e3c3ad7a47c7d64210d8c1c85b1a993'
#custom stuff
PROMPT='$(parse-git-branch) %n:%(?.%F{blue}👌 .%F{red}😂 %?)%f %B%F{240}%1~%f%b '
#PROMPT='%n:%(?.%F{blue}√.%F{red}?%?)%f %B%F{240}%1~%f%b '
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:/Users/$HOME/Library/Python/3.8/bin"
export PYENV_DIR=$HOME/.python_envs
export PYTHON_SCRIPTS_DIR="$HOME/.python_scripts"
export GPG_TTY=$(tty)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



pyenv() {
	source $PYENV_DIR/"$1"/bin/activate
}

pyenv-ls() {
	ls $PYENV_DIR/
}

py-ls() {
	ls $PYTHON_SCRIPTS_DIR
}

new-pyenv() {
	python -m venv $PYENV_DIR/$1
}


gc() {
git clone github:"$1"/"$2".git
}

gcm() {
git commit -m $1
}

tarp() {
tar --use-compress-program="pigz --best --recursive" -cf $1 $2
}
lz9() {
tar --use-compress-program="xz -9" -cf $1 $2
}

r64() {
	openssl rand -base64 $1
}

#export PI_MOVIES_DIR="/hdd0/Media/Movies"
export SOA_BOOKS_DIR="/bigboi/Media/Books"
export SOA_SHOWS_DIR="/bigboi/Media/Shows"
export SOA_MOVIES_DIR="/bigboi/Media/Movies"
#export SOA_MOVIES_DIR="/ssd/Media/Movies"
export SOA_MUSIC_DIR="/bigboi/Media/Music"

#export SOA_MOVIES_DIR="/ssd/Videos/Movies"

copySoa() {
	rsync -r --progress --ignore-existing "$1" "soa:$2"
}
cpMaccy(){
	rsync -r --progress "$1" "maccy:$2"
}
cpMovie() {
	copySoa "$1" "$SOA_MOVIES_DIR/"
}

cpShow() {
	copySoa "$1" "$SOA_SHOWS_DIR/"
}
cpMusic(){
	cpMaccy "$1" "/ssd/Media/Music/"
}

#cpMusic(){
#	copySoa "$1" "$SOA_MUSIC_DIR/"
#}
cpBook() {
	copySoa "$1" "$SOA_BOOKS_DIR/"
}

parse-git-branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

cargoWorkInit(){
if stat Cargo.toml 2> /dev/null > /dev/null
then
echo "Cargo.toml exists, aborting..."
return 1
fi
echo '[workspace]
members = [
]
'> Cargo.toml
}

publicIp() {
	dig @ns1.google.com TXT o-o.myaddr.l.google.com +short | grep -o '\(\d\+.\d\+.\d\+.\d\+\)'
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias udug='sudo apt-get update && sudo apt-get full-upgrade'

export PATH="$PATH:/home/bruh/.foundry/bin"
export PATH="/home/bruh/.local/bin:$PATH"

export PATH=$PATH:$HOME/.AppImages

export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
alias runAndroid='npx react-native run-android'

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
fpath+=~/.zfunc
autoload -Uz compinit && compinit
