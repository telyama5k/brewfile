# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# alias
alias coteditor='open $1 -a "/Applications/CotEditor.app"'
alias relogin='exec $SHELL -l'
alias gc='git checkout'
alias dps='docker ps  --format "table {{.ID}}	{{.Status}}	{{.Names}}	{{.Ports}}" | (read -r; printf "%s"; sort -k 3 );'
# Laravel Sail Command Alias
alias sail="./vendor/bin/sail"

# ls の色付け
export CLICOLOR=1

# git checkout peco
# co() {
#   git branch -a --sort=-authordate |
#     grep -v -e '->' -e '*' |
#     perl -pe 's/^\h+//g' |
#     perl -pe 's#^remotes/origin/###' |
#     perl -nle 'print if !$c{$_}++' |
#     peco |
#     xargs git checkout
# }

# pecoを使って端末操作を爆速にする https://qiita.com/reireias/items/fd96d67ccf1fdffb24ed

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history

function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

## pecoでgit checkout
gcop() {
  git branch --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/##' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}

## pecoでgit checkout リモート先のも全部版
gcopr() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/##' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}

## config参照してssh接続
function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/config | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh
bindkey 'SS' peco-ssh

# cdr
# if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
#     autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
#     add-zsh-hook chpwd chpwd_recent_dirs
#     zstyle ':completion:*' recent-dirs-insert both
#     zstyle ':chpwd:*' recent-dirs-default true
#     zstyle ':chpwd:*' recent-dirs-max 1000
#     zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
# fi
# 
# function peco-cdr () {
#     local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
#     if [ -n "$selected_dir" ]; then
#         BUFFER="cd ${selected_dir}"
#         zle accept-line
#     fi
# }
# zle -N peco-cdr
# bindkey '^E' peco-cdr



# export PATH="$HOME/.nodenv/bin:$PATH"
# eval "$(nodenv init -)"

eval "$(starship init zsh)"


#########################
# .zshrcの設定例（設定内容の説明コメント付き） - Qiita https://qiita.com/d-dai/items/d7f329b7d82e2165dab3


export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# goenv
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# mysql client
export PATH="$PATH:/usr/local/opt/mysql-client@5.7/bin"
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"

# # forGCP
# export CLOUDSDK_PYTHON=python2
# # Created by `userpath` on 2020-12-10 02:07:12
# export PATH="$PATH:/Users/yamada/.local/bin"

# zsh関連
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#   if type brew &>/dev/null; then
#     FPATH=/usr/local/share/zsh-completions:/usr/local/share/zsh/site-functions:/usr/share/zsh/site-functions:/usr/share/zsh/5.7.1/functions
# 
#     autoload -Uz compinit
#     compinit
#   fi

# PATH=${JAVA_HOME}/bin:${PATH}

# export JAVA_HOME= `/usr/bin/java`

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export STUDIO_JDK=${JAVA_HOME%/*/*}
eval "$(anyenv init -)"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
