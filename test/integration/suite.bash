#!/usr/bin/env bash

function setup() {
  if [ -z "${HYKES_BLUEPRINTER_PASSWORD}" ] || [ -z "${HYKES_BLUEPRINTER_TOKEN}" ] ; then
    skip 'Environment variables should exist'
  fi
}
