export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFhl'

_complete_hosts () {                                                                                
    COMPREPLY=()                                                                                    
    cur="${COMP_WORDS[COMP_CWORD]}"                                                                 
    host_list=`{                                                                                    
        for c in /etc/ssh_config /etc/ssh/ssh_config ~/.ssh/config                                  
        do [ -r $c ] && sed -n -e 's/^Host[[:space:]]//p' -e 's/^[[:space:]]*HostName[[:space:]]//p' $c
        done                                                                                        
        for k in /etc/ssh_known_hosts /etc/ssh/ssh_known_hosts ~/.ssh/known_hosts                   
        do [ -r $k ] && egrep -v '^[#\[]' $k|cut -f 1 -d ' '|sed -e 's/[,:].*//g'                   
        done                                                                                        
        sed -n -e 's/^[0-9][0-9\.]*//p' /etc/hosts; }|tr ' ' '\n'|grep -v '*'`                      
    COMPREPLY=( $(compgen -W "${host_list}" -- $cur))                                               
    return 0                                                                                        
}                                                                                                   
complete -F _complete_hosts ssh 


# Git auto complet
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
