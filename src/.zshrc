export ZSH_SRC_DIR=$HOME/.dotfiles/src
export $GITHUB_USER=""
export $CODE=""
. $ZSH_SRC_DIR/utils/main

PROMPT='%n:%(?.%F{blue}👌 .%F{red}😂 %?)%f %B%F{240}%1~%f%b '

os=$(getOs)

. $ZSH_SRC_DIR/packages/$os
. $ZSH_SRC_DIR/constants/main

constants $os


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
lz9d() {
    tar --use-compress-program="xz -d" -xf $1
}


cpMovie() {
	copySoa "$1" "$SOA_MOVIES_DIR/"
}

cpShow() {
	copySoa "$1" "$SOA_SHOWS_DIR/"
}
cpMusic(){
	copySoa "$1" "$SOA_MUSIC_DIR/"
}

cpBook() {
	copySoa "$1" "$SOA_BOOKS_DIR/"
}
