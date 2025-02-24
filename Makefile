STOW_PACKAGES = $(shell ls -d */ | tr -d '/' | sort)

all: submodules stow-packages

submodules:
	git submodule update --init

.PHONY: stow-packages
stow-packages:
	stow -R --adopt -t ~ -v $(STOW_PACKAGES)

.PHONY: uninstall-all
uninstall-all:
	@echo "remove stow packages..."
	stow -D -v -t ~ $(STOW_PACKAGES)
