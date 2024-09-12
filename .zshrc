LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
alias ls='ls -G'

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
alias lports='lsof -P -iTCP -sTCP:LISTEN'
alias python=python3
alias gadd="git add"

export CODE=$HOME/code
export RUST=$CODE/rs
export DEV_KEY_ANVIL='0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80'
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

# bin stuff
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$CODE/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN

export PATH="$PATH:$HOME/.cargo/bin"
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



py() {
	python $PYTHON_SCRIPTS_DIR/$1.py
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
