
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

CFLAGS=-Wall -Werror


all: apt-get-snapshot.1

.PHONY: all install clean

apt-get-snapshot.1: manual.t2t
	txt2tags -t man -i $^ -o $@

README.textile: manual.t2t
	txt2tags -t html -H -i $^ -o $@
	sed -i -e 's@<B>@**@g' -e 's@</B>@**@g' $@

clean:
	rm -f apt-get-snapshot.1

install: apt-get-snapshot.1
	mkdir -p $(BINDIR)
	install apt-get-snapshot $(BINDIR)/apt-get-snapshot
	mkdir -p $(MANDIR)/man1
	install apt-get-snapshot.1 $(MANDIR)/man1/apt-get-snapshot.1

