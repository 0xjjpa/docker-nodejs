DEV-SETUP=git@github.com:jjperezaguinaga/vagrant-docker.git

# Symlinks options
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
 LN_OPTS=-sfn
endif
ifeq ($(UNAME_S),Darwin)
 LN_OPTS=-sfh
endif

init:
	if ! [ -a .dev-setup ]; then git subtree add --prefix .dev-setup $(DEV-SETUP)  master --squash; fi;

setup:
	ln $(LN_OPTS) .dev-setup/Vagrantfile ./Vagrantfile
	ln $(LN_OPTS) .dev-setup/Vagrantfile.host ./Vagrantfile.host

bootstrap: init setup

