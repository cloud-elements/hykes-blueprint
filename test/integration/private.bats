#!/usr/bin/env bats

load suite

@test 'init should download and configure a private blueprint repo' {
  build/bin/hykes-blueprinter init \
    build/tmp \
    "https://${HYKES_BLUEPRINTER_TOKEN}@api.github.com/repos/cloud-elements/dev.ops.cloud-elements.com/tarball/master"
}

@test 'decrypt should decrypt an encrypted blueprint' {
  build/bin/hykes-blueprinter decrypt --password="${HYKES_BLUEPRINTER_PASSWORD}"
}

@test 'decrypted should output true and exit 0 with an decrypted blueprint' {
  run build/bin/hykes-blueprinter decrypted
  [ ${status} -eq 0 ]
  [ "${output}" = 'true' ]
}

@test 'encrypted should output false and exit 1 with an decrypted blueprint' {
  run build/bin/hykes-blueprinter encrypted
  [ ${status} -eq 1 ]
  [ "${output}" = 'false' ]
}

@test 'list-servers should output server list' {
  run build/bin/hykes-blueprinter list-servers
  [ ${status} -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test 'encrypt should encrypt a decrypted blueprint' {
  build/bin/hykes-blueprinter encrypt --password="${HYKES_BLUEPRINTER_PASSWORD}"
}

@test 'decrypted should output false and exit 1 with an encrypted blueprint' {
  run build/bin/hykes-blueprinter decrypted
  [ ${status} -eq 1 ]
  [ "${output}" = 'false' ]
}

@test 'encrypted should output true and exit 0 with an encrypted blueprint' {
  run build/bin/hykes-blueprinter encrypted
  [ ${status} -eq 0 ]
  [ "${output}" = 'true' ]
}
