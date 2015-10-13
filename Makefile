DEV-SETUP=git@github.com:jjperezaguinaga/vagrant-docker.git

init:
	if ! [ -a .dev-setup ]; then git subtree add --prefix .dev-setup $(DEV-SETUP)  master --squash; fi;
