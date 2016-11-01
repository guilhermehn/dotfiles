# Path to your oh-my-zsh installation.
export ZSH=/home/rhs/.oh-my-zsh
DISABLE_AUTO_UPDATE=true
ZSH_THEME="ys"

# Requires
# https://github.com/zsh-users/zsh-syntax-highlighting and
# https://github.com/zsh-users/zsh-autosuggestions
plugins=(git sudo common-aliases zsh-autosuggestions zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl\
  :/usr/bin/vendor_perl:/usr/bin/core_perl"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export VISUAL="vim"
export WINEPREFIX=$HOME/.WF_x64

source $ZSH/oh-my-zsh.sh

# dirstack handling
DIRSTACKSIZE=${DIRSTACKSIZE:-20}
DIRSTACKFILE=${DIRSTACKFILE:-${ZDOTDIR:-${HOME}}/.zdirs}

typeset -gaU GRML_PERSISTENT_DIRSTACK
function grml_dirstack_filter() {
local -a exclude
local filter entry
if zstyle -s ':grml:chpwd:dirstack' filter filter; then
	$filter $1 && return 0
fi
if zstyle -a ':grml:chpwd:dirstack' exclude exclude; then
	for entry in "${exclude[@]}"; do
		[[ $1 == ${~entry} ]] && return 0
	done
fi
return 1
}

chpwd() {
	(( $DIRSTACKSIZE <= 0 )) && return
	[[ -z $DIRSTACKFILE ]] && return
	grml_dirstack_filter $PWD && return
	GRML_PERSISTENT_DIRSTACK=(
	$PWD "${(@)GRML_PERSISTENT_DIRSTACK[1,$DIRSTACKSIZE]}"
	)
	builtin print -l ${GRML_PERSISTENT_DIRSTACK} >! ${DIRSTACKFILE}
}

if [[ -f ${DIRSTACKFILE} ]]; then
	# Enabling NULL_GLOB via (N) weeds out any non-existing
	# directories from the saved dir-stack file.
	dirstack=( ${(f)"$(< $DIRSTACKFILE)"}(N) )
	# "cd -" won't work after login by just setting $OLDPWD, so
	[[ -d $dirstack[1] ]] && cd -q $dirstack[1] && cd -q $OLDPWD
fi

if zstyle -T ':grml:chpwd:dirstack' filter-on-load; then
	for i in "${dirstack[@]}"; do
		if ! grml_dirstack_filter "$i"; then
			GRML_PERSISTENT_DIRSTACK=(
			"${GRML_PERSISTENT_DIRSTACK[@]}"
			$i
			)
		fi
	done
else
	GRML_PERSISTENT_DIRSTACK=( "${dirstack[@]}" )
fi


setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

## Aliases
#
alias gc++='g++ -std=c++11 -g -O2 -Wall -Wextra -Wfloat-equal -Wundef -Wshadow -Wpointer-arith \
  -Wcast-align -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default -Wswitch-enum \
  -Wconversion -Wunreachable-code -Winit-self -Wuninitialized -Winline -fsanitize=address \
  -fno-omit-frame-pointer'
alias gentags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
alias ds='dirs -v'
alias wine_x64='WINEPREFIX=~/.WF_x64'
alias wine_x32='WINEARCH=win32 WINEPREFIX=~/.WF_x32'
alias update='sudo pacman -Syu && pacaur -Su'
alias pw='pass -c'
alias clamfull="sudo clamscan --recursive=yes --infected --move=$HOME/Documents/C_VAULT \
  --max-filesize=2000M --max-scansize=2000M --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' /"
alias sshrpi='TERM=xterm ssh -p 22 rhs@192.168.1.47'
alias sshfsrpiroot='sshfs -p 22 rhs@192.168.1.47:/ ~/Documents/SSH/ROOT'
alias sshfsrpiweb='sshfs -p 22 rhs@192.168.1.47:/srv/http ~/Documents/SSH/WWW'
alias sshvbox='TERM=xterm ssh -p 22 rhs@192.168.56.2'
alias sshfsvbox='sshfs -p 22 rhs@192.168.56.2:/ ~/Documents/SSH/VBOX'
alias clr="printf '\33c\e[3J'"
alias v='vagrant'
alias startx='ssh-agent startx'
