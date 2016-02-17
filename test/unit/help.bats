#!/usr/bin/env bats

@test '-h should output usage' {
  run build/bin/hykes-blueprint -h
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test '--help should output usage' {
  run build/bin/hykes-blueprint --help
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
