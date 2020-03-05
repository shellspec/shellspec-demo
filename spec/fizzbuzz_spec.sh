# shellcheck shell=sh

Describe "fizzbuzz.sh"
  It 'is Fizz Buzz'
    When run script ./fizzbuzz.sh
    The line 1 of output should eq "1"
    The line 2 of output should eq "2"
    The line 3 of output should eq "Fizz"
    The line 4 of output should eq "4"
    The line 5 of output should eq "Buzz"
    The line 6 of output should eq "Fizz"
    The line 7 of output should eq "7"
    The line 10 of output should eq "Buzz"
    The line 15 of output should eq "FizzBuzz"
  End

  It 'count up to 30 by default'
    When run script ./fizzbuzz.sh
    The lines of output should eq 30
  End

  It 'can be specified count by argument'
    When run script ./fizzbuzz.sh 100
    The lines of output should eq 100
  End
End
