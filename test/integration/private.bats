#!/usr/bin/env bats

function setup() {
  if [ -z "${HYKES_BLUEPRINTER_URL_PRIVATE}" ] || [ -z "${HYKES_BLUEPRINTER_PASSWORD}" ]; then
    skip 'Environment variables should exist'
  fi
}

@test 'init should download and configure a private blueprint repo' {
  build/bin/hykes-blueprinter init build/tmp "${HYKES_BLUEPRINTER_URL_PRIVATE}"
}

@test 'decrypt should decrypt an encrypted blueprint' {
  build/bin/hykes-blueprinter decrypt --password="${HYKES_BLUEPRINTER_PASSWORD}"
}

@test 'decrypted should exit 0 and output true with a decrypted blueprint' {
  run build/bin/hykes-blueprinter decrypted
  [ ${status} -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}

@test 'encrypted should exit 1 and output false with a decrypted blueprint' {
  run build/bin/hykes-blueprinter encrypted
  [ ${status} -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'list-servers should output server list' {
  run build/bin/hykes-blueprinter list-servers
  [ ${status} -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test 'encrypt should encrypt a decrypted blueprint' {
  build/bin/hykes-blueprinter encrypt --password="${HYKES_BLUEPRINTER_PASSWORD}"
}

@test 'decrypted should exit 1 and output false with an encrypted blueprint' {
  run build/bin/hykes-blueprinter decrypted
  [ ${status} -eq 1 ]
  [ "${lines[1]}" = 'false' ]
}

@test 'encrypted should exit 0 and output true with an encrypted blueprint' {
  run build/bin/hykes-blueprinter encrypted
  [ ${status} -eq 0 ]
  [ "${lines[1]}" = 'true' ]
}
