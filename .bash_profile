# > export variables

export GPGKEY=8304425CA8C30F38

# < export variables

# > setup gpg-agent to manage ssh

gpg-agent --daemon

unset SSH_AGENT_PID

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye > /dev/null

# < setup gpg-agent to manage ssh

# > reload ~/.bashrc

. ~/.bashrc

# < reload ~/.bashrc
