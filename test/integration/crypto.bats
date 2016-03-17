#!/usr/bin/env bats

load suite

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
