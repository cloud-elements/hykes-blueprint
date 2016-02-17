#!/usr/bin/env bats

function setup() {
  if [ -z "${HYKES_BLUEPRINT_PRIVATE_PATH}" ] || \
    [ -z "${HYKES_BLUEPRINT_PRIVATE_URL}" ] || \
    [ -z "${HYKES_BLUEPRINT_PRIVATE_PASSWORD}" ]; then

    skip 'Environment variables should exist'
  fi
}

@test 'init should download and configure a private blueprint repo' {
  build/bin/hykes-blueprint init "${HYKES_BLUEPRINT_PRIVATE_PATH}" "${HYKES_BLUEPRINT_PRIVATE_URL}"
}

@test 'decrypt should decrypt an encrypted blueprint' {
  build/bin/hykes-blueprint decrypt --password="${HYKES_BLUEPRINT_PRIVATE_PASSWORD}"
}

@test 'decrypted should exit 0 and output true with a decrypted blueprint' {
  run build/bin/hykes-blueprint decrypted
  [ "${status}" -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}

@test 'encrypted should exit 1 and output false with a decrypted blueprint' {
  run build/bin/hykes-blueprint encrypted
  [ "${status}" -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'list-servers should exit 0 and output server list with a decrypted blueprint' {
  run build/bin/hykes-blueprint list-servers
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test 'encrypt should encrypt a decrypted blueprint' {
  build/bin/hykes-blueprint encrypt --password="${HYKES_BLUEPRINT_PRIVATE_PASSWORD}"
}

@test 'decrypted should exit 1 and output false with an encrypted blueprint' {
  run build/bin/hykes-blueprint decrypted
  [ "${status}" -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'encrypted should exit 0 and output true with an encrypted blueprint' {
  run build/bin/hykes-blueprint encrypted
  [ "${status}" -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}

@test 'list-servers should exit 1 with an encrypted blueprint' {
  run build/bin/hykes-blueprint list-servers
  [ "${status}" -eq 1 ]
}
