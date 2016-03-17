#!/usr/bin/env bats

function clone-repo() {
  git clone git@github.com:cloud-elements/hykes-spec.git build/tmp/hykes-spec
}

function exists-repo() {
  test -d build/tmp/hykes-spec
}

function setup() {
  if ! exists-repo; then clone-repo; fi && cd build/tmp/hykes-spec
}
