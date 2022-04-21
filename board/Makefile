host=10.49.2.5 # donald
user=wjrh
ssh=ssh $(user)@$(host)


install:
	rsync stream.sh $(user)@$(host)/usr/bin/stream
	rsync stream.service $(user)@$(host)/etc/systemd/system/stream.service

up:
	$(ssh) sudo systemctl enable stream
	$(ssh) sudo systemctl start stream

down:
	$(ssh) sudo systemctl disable stream
	$(ssh) sudo systemctl stop stream

status:
	$(ssh) sudo systemctl status stream



init-ssh:
	ssh-copy-id $(user)@$(host)
