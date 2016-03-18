#!/usr/bin/env bats

function clone-repo() {
  git clone git@github.com:cloud-elements/hykes-spec.git build/tmp/hykes-spec
  (cd build/tmp/hykes-spec && \
    git checkout $(git describe --tags $(git rev-list --tags --max-count=1)))
}

function exists-repo() {
  test -d build/tmp/hykes-spec
}

function setup() {
  if ! exists-repo; then clone-repo; fi && cd build/tmp/hykes-spec
}
