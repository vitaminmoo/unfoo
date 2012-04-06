# Testing

Tests are written using [shunit2](https://code.google.com/p/shunit2/). Tests
are placed in a file named test_NAME_OF_TEST.sh and the file is made
executible. Individual tests are placed within a function starting with the
string 'test'. For more information see the shunit2 documentation at
https://shunit2.googlecode.com/svn/trunk/source/2.1/doc/shunit2.html and the
test files included.

## Running tests

To run tests you can either run `./test_NAME_OF_TEST.sh` to run an individual
test file or run `make test` from either the tests or top level directory to
run the whole suite.
