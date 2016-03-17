#!/usr/bin/env bats

load suite

@test 'ls should exit 0 and output server list' {
  run ../../bin/hykes-blueprint ls
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
