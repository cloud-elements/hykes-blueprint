#!/usr/bin/env bats

@test '-h should output usage' {
  run build/bin/hykes-blueprinter -h
  [ ${status} -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test '--help should output usage' {
  run build/bin/hykes-blueprinter --help
  [ ${status} -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
