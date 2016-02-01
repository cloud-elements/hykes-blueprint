#!/usr/bin/env bats

@test '-v should output version' {
  run build/bin/hykes-blueprinter -v
  [ "${status}" -eq 0 ]
  [ $(expr "${output}" : 'v*') -ne 0 ]
}

@test '--version should output version' {
  run build/bin/hykes-blueprinter --version
  [ "${status}" -eq 0 ]
  [ $(expr "${output}" : 'v*') -ne 0 ]
}
