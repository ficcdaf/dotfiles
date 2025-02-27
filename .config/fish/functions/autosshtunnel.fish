function autosshtunnel
start-ssh-agent
tmux new-session -d 'autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 1675:ibox:22 isa@172.105.6.137'
end
