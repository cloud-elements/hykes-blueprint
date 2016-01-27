bindir ?= ./build/bin
etcdir ?= ./build/etc
uname := $(shell uname -s)

apt:
ifeq (${uname}, Linux)
	@apt-add-repository ppa:ansible/ansible -y
	@add-apt-repository ppa:duggan/bats -y
	@apt-get update
	@apt-get install software-properties-common
	@apt-get install ansible
	@apt-get install bats
	@apt-get install git
endif

brew:
ifeq (${uname}, Darwin)
	@brew install ansible
	@brew install bats
	@brew install coreutils
	@brew install git
endif

clean: | uninstall

dependencies: | apt brew

install: | stub
	@rsync -a src/ ${bindir}/
ifeq (${uname}, Darwin)
	@$(eval _bindir := $(shell greadlink -f ${bindir}))
	@$(eval _etcdir := $(shell greadlink -f ${etcdir}))
	@sed -i '' "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-blueprinter
	@sed -i '' "s|etcdir=|etcdir=${_etcdir}|g" ${bindir}/hykes-blueprinter
else ifeq (${uname}, Linux)
	@$(eval _bindir := $(shell readlink -f ${bindir}))
	@$(eval _etcdir := $(shell readlink -f ${etcdir}))
	@sed -i "s|bindir=|bindir=${_bindir}|g" ${bindir}/hykes-blueprinter
	@sed -i "s|etcdir=|etcdir=${_etcdir}|g" ${bindir}/hykes-blueprinter
	@sed -i "s|sed -i ''|sed -i|g" ${bindir}/hykes-blueprinter
	@sed -i "s|greadlink|readlink|g" ${bindir}/hykes-blueprinter

endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${etcdir}

test: | test-unit test-integration

test-integration: | install
	@bats test/integration

test-unit: | install
	@bats test/unit

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${etcdir}

.PHONY: apt brew clean dependencies install stub test test-integration test-unit uninstall
