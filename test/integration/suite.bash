#!/usr/bin/env bash

function setup() {
  if [ -z "${HYKES_BLUEPRINTER_PASSWORD}" ] || \
    [ -z "${HYKES_BLUEPRINTER_GIT_URL_PUBLIC}" ] || \
    [ -z "${HYKES_BLUEPRINTER_GIT_URL_PRIVATE}" ]; then

    skip 'Environment variables should exist'
  fi
}
