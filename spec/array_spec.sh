# shellcheck shell=sh

Describe "array.sh"
  Include lib/array.sh

  Before "IFS=,"

  Describe "array_shift()"
    _array_shift() {
      name=$1 && shift
      eval "$(array_shift "$name" "$@")"
      echo "$*"
    }

    It "shifts positional parameters"
      When call _array_shift var 1 2 3 4 5
      The variable var should eq 1
      The stdout should eq "2,3,4,5"
    End
  End

  Describe "array_unshift()"
    _array_unshift() {
      name=$1 && shift
      eval "$(array_unshift "$name" "$@")"
      echo "$*"
    }

    It "unshifts positional parameters"
      BeforeCall "var=a"
      When call _array_unshift var 1 2 3 4 5
      The stdout should eq "a,1,2,3,4,5"
    End
  End

  Describe "array_push()"
    _array_push() {
      name=$1 && shift
      eval "$(array_push "$name" "$@")"
      echo "$*"
    }

    It "pushes to the positional parameters"
      BeforeCall "var=a"
      When call _array_push var 1 2 3 4 5
      The stdout should eq "1,2,3,4,5,a"
    End
  End

  Describe "array_pop()"
    _array_pop() {
      name=$1 && shift
      eval "$(array_pop "$name" "$@")"
      echo "$*"
    }

    It "popes from the positional parameters"
      When call _array_pop var 1 2 3 4 5
      The variable var should eq 5
      The stdout should eq "1,2,3,4"
    End
  End
End
