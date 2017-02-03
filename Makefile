#!/usr/bin/make -f

all:
	gpg --lock-never \
	    --no-default-keyring \
	    --keyring ./temp-keyring.kbx \
	    --import *.asc
	gpg --lock-never \
	    --no-default-keyring \
	    --keyring ./temp-keyring.kbx \
	    --export > pkg-lxqt-archive-keyring.gpg
	$(RM) temp-keyring.kbx temp-keyring.kbx~
	$(RM) pkg-lxqt-archive-keyring.gpg~

install:

clean:
	$(RM) temp-keyring.kbx temp-keyring.kbx~
	$(RM) pkg-lxqt-archive-keyring.gpg

check:

test:

