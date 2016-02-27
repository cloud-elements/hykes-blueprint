.DEFAULT_GOAL := stub
bindir ?= ./build/bin
tmpdir ?= ./build/tmp
uname := $(shell uname -s)

clean: | uninstall

install: | stub
	@rsync -a src/ ${bindir}/
ifeq (${uname}, Linux)
	@sed -i "s|sed -i ''|sed -i|g" ${bindir}/hykes-blueprint
	@sed -i "s|greadlink|readlink|g" ${bindir}/hykes-blueprint
endif

stub:
	@mkdir -p ${bindir}
	@mkdir -p ${tmpdir}

test: | test-unit test-integration

test-integration: | install
	@bats test/integration

test-unit: | install
	@bats test/unit

uninstall:
	@rm -rf ${bindir}
	@rm -rf ${tmpdir}

.PHONY: clean install stub test test-integration test-unit uninstall
