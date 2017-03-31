EMAIL = nueno@juniper.net
PACKAGE = ukai

PWD := ${CURDIR}
SRC_VER := $(shell cat ./version.info)
BUILDTIME := $(shell date -u +%y%m%d%H%M)

ifndef CONTRAIL_VERSION
VERSION = 
ifdef TAG
VERSION = $(SRC_VER)-$(TAG)
else
VERSION = $(SRC_VER)-$(BUILDTIME)
endif
else
VERSION = $(CONTRAIL_VERSION)
endif

OPT = $(DESTDIR)/opt/ukai
BIN = $(DESTDIR)/usr/bin

all: test

deb:
	rm -f ../$(PACKAGE)_$(SRC_VER).orig.tar.xz
	dh_make --createorig -p $(PACKAGE)_$(VERSION) -C s -e $(EMAIL) -c apache -y || true
	rm -f debian/changelog
	dch --create --distribution stable --package $(PACKAGE) --newversion $(VERSION) "ukai package"
	mv ../$(PACKAGE)_$(VERSION).orig.tar.xz ../$(PACKAGE)_$(SRC_VER).orig.tar.xz 
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
	cp bin/gohan-linux-amd64 $(BIN)/ukai
