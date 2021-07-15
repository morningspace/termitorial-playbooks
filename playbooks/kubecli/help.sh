function test-kubectl {
  if command -v kubectl >/dev/null 2>&1 ; then
    log::info "kubectl has already been installed on your system."
    return 1
  fi
}

function test-helm {
  if command -v helm >/dev/null 2>&1 ; then
    log::info "helm has already been installed on your system."
    return 1
  fi
}