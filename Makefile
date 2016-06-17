EMAIL = nueno@juniper.net
PACKAGE = ukai
VERSION = 1.0
GOHAN = https://github.com/cloudwan/gohan/releases/download/pre-release/gohan-linux-amd64.zip
OPT = $(DESTDIR)/opt/ukai
BIN = $(DESTDIR)/usr/bin

all: test

deb:
	rm -f ../$(PACKAGE)_$(VERSION).orig.tar.xz
	dh_make --createorig -p $(PACKAGE)_$(VERSION) -C s -e $(EMAIL) -c apache -s -y || true
	rm -f debian/*.ex debian/*.EX 
	debuild -rfakeroot -uc -us
test:
	echo "Skipped"

install:
	mkdir -p $(OPT)
	mkdir -p $(BIN)
	cp gohan.yaml $(OPT)
	cp -r extensions $(OPT)
	cp -r schema $(OPT)
	cp -r public $(OPT)
	cp -r packager $(OPT)
	rm -r ./gohan
	curl -OL $(GOHAN)
	unzip gohan-linux-amd64.zip
	cp gohan $(BIN)/ukai
