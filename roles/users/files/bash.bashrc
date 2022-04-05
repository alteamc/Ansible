[ -z "$PS1" ] && return

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "`id -u`" -eq 0 ]; then
    PS1='\[\e[1;32m\][\t]\[\e[1;31m\]${debian_chroot:+($debian_chroot)}\u\[\e[1;33m\]@\[\e[1;36m\]\h \[\e[1;33m\]\w \[\e[1;35m\]\$ \[\e[0m\] '
    PS2='\[\e[1;31m\]>\[\e[0m\] '
else
    PS1='\[\e[1;32m\][\t]\[\e[1;94m\]${debian_chroot:+($debian_chroot)}\u\[\e[1;33m\]@\[\e[1;36m\]\h \[\e[1;33m\]\w \[\e[1;35m\]\$ \[\e[0m\] '
    PS2='\[\e[1;30m\]>\[\e[0m\] '
fi

if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
        function command_not_found_handle {
                # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
                   /usr/bin/python /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
                   /usr/bin/python /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
                else
                   printf "%s: command not found\n" "$1" >&2
                   return 127
                fi
        }
fi

HISTCONTROL=ignoredups
HISTTIMEFORMAT='%Y.%m.%d %T '
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

if [ -x /usr/bin/dircolors ]; then
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
