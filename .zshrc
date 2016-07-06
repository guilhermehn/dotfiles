# Path to your oh-my-zsh installation.
export ZSH=/home/rhs/.oh-my-zsh
DISABLE_AUTO_UPDATE=true
ZSH_THEME="ys"

plugins=(git sudo common-aliases zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
#export HTML_TIDY="/home/rhs/.config/tidy-html5/conf.txt"
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


alias gc++='g++ -std=c++11 -g -O2 -Wall -Wextra -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -Winit-self -Wuninitialized -Winline -fsanitize=address -fno-omit-frame-pointer'
alias compall='gc++ *.cpp -o'
alias compmain='gc++ main.cpp -o main'
alias gentags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
alias c++dir='~/bin/./cppwork'
alias ds='dirs -v'
alias wine_x64='WINEPREFIX=~/.WF_x64'
alias wine_x32='WINEARCH=win32 WINEPREFIX=~/.WF_x32'
alias sshrpi='TERM=xterm ssh -p 22 rhs@192.168.1.47'
alias sshfsrpi='sshfs -p 22 rhs@192.168.1.47:/ ~/Documents/SSH/ROOT'
alias sshfsrpiweb='sshfs -p 22 rhs@192.168.1.47:/srv/http ~/Documents/SSH/WWW'
alias sshlaptop='ssh -p 2222 rhs@192.168.1.46'
alias stopvpn='sudo systemctl stop openvpn@US_New_York_City.service'
alias startvpn='sudo systemctl start openvpn@US_New_York_City.service'
alias pacupdate="sudo pacman -Syu && pacaur -Su"
