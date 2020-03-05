# shellcheck shell=sh

Describe "system test"
  Specify 'bash 4.x or 5.x installed'
    When run bash -c 'echo $BASH_VERSION'
    The output should match pattern '[45].*'
  End

  version() {
    version=${version%.*}
    [ "${version%%.*}" -gt "${1%%.*}" ] && return 0
    [ "${version%%.*}" -eq "${1%%.*}" ] && [ "${version#*.}" -ge "${1#*.}" ]
  }

  Specify 'git version => 2.10 installed'
    When run git --version # => git version x.x.x
    The third word of output should satisfy version 2.10
  End

  check_curl_or_wget_installed() {
    { type curl || type wget; } >/dev/null
  }

  Specify 'curl or wget installed'
    When call check_curl_or_wget_installed
    The status should be success
  End
End
