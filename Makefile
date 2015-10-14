DEV-SETUP=git@github.com:jjperezaguinaga/vagrant-docker.git

init:
	if ! [ -a .dev-setup ]; then git subtree add --prefix .dev-setup $(DEV-SETUP)  master --squash; fi;

update:
	if [ -a .dev-setup ]; then git subtree push --prefix .dev-setup $(DEV-SETUP) master; fi;

bootstrap: init

# Virtual Machine Development

up:
	make -C .dev-setup up

status:
	make -C .dev-setup status

destroy:
	make -C .dev-setup destroy $(ID)

global-status:
	make -C .dev-setup global-status

reload:
	make -C .dev-setup reload

logs:
	make -C .dev-setup logs
