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

update:
	if [ -a .dev-setup ]; then git subtree push --prefix .dev-setup $(DEV-SETUP) master; fi;

setup:
	ln $(LN_OPTS) .dev-setup/Vagrantfile ./Vagrantfile
	ln $(LN_OPTS) .dev-setup/Vagrantfile.host ./Vagrantfile.host

bootstrap: init setup

# Virtual Machine Development

up:
	make -C .dev-setup up

status:
	make -C .dev-setup status

destroy:
	make -C .dev-setup destroy $(ID)

global-status:
	make -C .dev-setup global-status
