function start-ssh-agent
eval (ssh-agent -c)
ssh-add /home/isa/.ssh/id_rsa
end
