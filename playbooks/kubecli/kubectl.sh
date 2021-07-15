function test-kubectl {
  if command -v kubectl >/dev/null 2>&1 ; then
    log::info "kubectl has already been installed on your system."
    return 1
  fi
}