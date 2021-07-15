function test-kind {
  if command -v kind >/dev/null 2>&1 ; then
    log::info "kind has already been installed on your system."
    return 1
  fi
}