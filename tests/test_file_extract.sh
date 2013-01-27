#! /bin/sh

# load test helpers
. ./test_helpers


test_file_extract() {
    for name in gz bz2 lzma xz gzip
    do
        echo "Testing ${name}"
        extract_archive $name
    done
}
extract_archive() {
    ext=$1
    cd $SHUNIT_TMPDIR

    $PROGRAM $FIXTURES/ipsum.txt.${ext} > /dev/null
    result_val=$?

    assertTrue $result_val
    assertOutputSame ipsum.txt ${OUTPUT}/ipsum.txt.expected
    cd - >/dev/null
    rm -rf $SHUNIT_TMPDIR/*
}

# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
