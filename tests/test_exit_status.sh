#! /bin/sh

# load test helpers
. ./test_helpers


test_exit_code_success() {
    cd $SHUNIT_TMPDIR
    $PROGRAM $FIXTURES/single_file.tar > /dev/null
    result_val=$?

    assertTrue "Succesful exit code" $result_val
    cd - >/dev/null
}

test_exits_with_error() {
    cd $SHUNIT_TMPDIR
    $PROGRAM no.such.file.tar > /dev/null 2>/dev/null
    result_val=$?

    assertFalse $result_val
    cd - >/dev/null
}

test_exit_code_usage() {
    cd $SHUNIT_TMPDIR
    output=$($PROGRAM)
    result_val=$?

    assertEquals "Wrong usage exit code" 1 $result_val
    assertEquals "unfoo: You must specify at least one file" "$output"
    cd - >/dev/null
}

tearDown() {
    rm -rf $SHUNIT_TMPDIR/*
}

# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
