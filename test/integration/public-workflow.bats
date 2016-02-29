#!/usr/bin/env bats

function clone-repo() {
  git clone "${HYKES_BLUEPRINT_PUBLIC_URL}" "${HYKES_BLUEPRINT_PUBLIC_PATH}"
}

function exists-repo() {
  test -d "${HYKES_BLUEPRINT_PUBLIC_PATH}"
}

function should-have-env() {
  if [ -z "${HYKES_BLUEPRINT_PUBLIC_PATH}" ] || [ -z "${HYKES_BLUEPRINT_PUBLIC_URL}" ]; then
    skip 'Environment variables should exist'
  fi
}

function setup() {
  should-have-env && if ! exists-repo; then clone-repo; fi && cd "${HYKES_BLUEPRINT_PUBLIC_PATH}"
}

@test 'encrypt should encrypt a decrypted blueprint' {
  ../../bin/hykes-blueprint encrypt --password=password
}

@test 'decrypted should exit 1 and output false with an encrypted blueprint' {
  run ../../bin/hykes-blueprint decrypted
  [ "${status}" -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'encrypted should exit 0 and output true with an encrypted blueprint' {
  run ../../bin/hykes-blueprint encrypted
  [ "${status}" -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}

@test 'ls should exit 1 with an encrypted blueprint' {
  run ../../bin/hykes-blueprint ls
  [ "${status}" -eq 1 ]
}

@test 'decrypt should decrypt an encrypted blueprint' {
  ../../bin/hykes-blueprint decrypt --password=password
}

@test 'decrypted should exit 0 and output true with a decrypted blueprint' {
  run ../../bin/hykes-blueprint decrypted
  [ "${status}" -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}

@test 'encrypted should exit 1 and output false with a decrypted blueprint' {
  run ../../bin/hykes-blueprint encrypted
  [ "${status}" -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'ls should exit 0 and output server list with a decrypted blueprint' {
  run ../../bin/hykes-blueprint ls
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
