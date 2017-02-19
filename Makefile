#!/usr/bin/make -f

all:
	gpg 	--homedir $$(pwd)/.gnupg \
		--lock-never \
		--no-default-keyring \
		--keyring ./temp-keyring.kbx \
		--import *.asc || return 0
	gpg 	--homedir $$(pwd)/.gnupg \
		--lock-never \
		--no-default-keyring \
		--keyring ./temp-keyring.kbx \
		--export > pkg-lxqt-archive-keyring.gpg || return 0
	gpg     --homedir $$(pwd)/.gnupg \
	        --lock-never \
	        --no-default-keyring \
	        --keyring ./temp-keyring.kbx \
	        --export > pkg-lxqt-archive-keyring.gpg || return 0
	gpgconf --kill gpg-agent
	$(RM) temp-keyring.kbx temp-keyring.kbx~
	$(RM) pkg-lxqt-archive-keyring.gpg~

install:

clean:
	$(RM) temp-keyring.kbx temp-keyring.kbx~
	$(RM) pkg-lxqt-archive-keyring.gpg
	$(RM) -r $$(pwd)/.gnupg

check:

test:
