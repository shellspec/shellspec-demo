# shellcheck shell=sh
# ========================================
# utilities for positional parameters
# ========================================

array_shift() {
  echo "$1=\$1; shift"
}

array_unshift() {
  echo "set -- \"\$$1\" \"\$@\""
}

array_push() {
  echo "set -- \"\$@\" \"\$$1\""
}

array_pop() {
  echo "set -- \$((\$#*2)) \"\$@\""
  echo "for $1; do [ \$# -le \$1 ] && set -- \"\$@\" \"\$$1\"; done"
  echo "shift \$((\$1/2+2))"
}
