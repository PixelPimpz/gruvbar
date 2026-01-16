#!/usr/bin/env bash
fatal() {
  local E="$1"
  dump "${E}"
  exit 1
}
