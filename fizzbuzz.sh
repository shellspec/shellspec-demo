#!/bin/bash

[ $# -le 1 ] && set -- 1 $((${1:-30}))
[ "$1" -le "$2" ] || exit 0

case $(($1 % 3))$(($1 % 5)) in
  00) echo FizzBuzz ;;
  0?) echo Fizz ;;
  ?0) echo Buzz ;;
  ??) echo "$1" ;;
esac

# No loop. but this is slow :-)
exec "$0" $(($1 + 1)) "$2"
