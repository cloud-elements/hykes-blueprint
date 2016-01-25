bindir ?= ./build/bin
etcdir ?= ./build/etc
uname := $(shell uname -s)

apt:
ifeq (${uname}, Linux)
	@add-apt-repository ppa:duggan/bats --yes
	@apt-get update
	@apt-get install bats
endif

brew:
ifeq (${uname}, Darwin)
	@brew install bats
	@brew install coreutils
endif

clean: | uninstall

dependencies: | apt brew

install: | stub
	@rsync -a src/ ${bindir}/
ifeq (${uname}, Darwin)
	@$(eval _bindir := $(shell greadlink -f ${bindir}))
	@$(eval _etcdir := $(shell greadlink -f ${etcdir}))
	@sed -i ''  "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-blueprinter
	@sed -i ''  "s|etcdir=|etcdir=${_etcdir}|g" ${bindir}/hykes-blueprinter
else ifeq (${uname}, Linux)
	@$(eval _bindir := $(shell readlink -f ${bindir}))
	@$(eval _etcdir := $(shell readlink -f ${etcdir}))
	@sed -i "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-blueprinter
	@sed -i "s|etcdir=|etcdir=${_etcdir}|g" ${bindir}/hykes-blueprinter
	@sed -i "s|sed -i ''|sed -i|g" ${bindir}/hykes-blueprinter
endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${etcdir}

test: | test-unit test-integration

test-unit: | install
	@bats \
		test/unit/help.bats \
		test/unit/version.bats

test-integration: | install
	@bats \
		test/integration/private.bats \
		test/integration/public.bats

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${etcdir}

.PHONY: apt brew clean dependencies install stub test test-integration test-unit uninstall
