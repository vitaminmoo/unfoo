#! /bin/sh

# load test helpers
. ./test_helpers


test_subfolder() {
    for name in tar tar.gz tar.bz2 tar.lzma tar.xz ace rar zip 7z
    do
        echo "Testing ${name}"
        extract_subfolder $name
    done
}
extract_subfolder() {
    ext=$1
    cd $SHUNIT_TMPDIR
    $PROGRAM $FIXTURES/with_subfolder.${ext} > /dev/null
    result_val=$?
    find extracted_subfolder | sort > find.out

    assertTrue $result_val
    assertOutputSame find.out ${OUTPUT}/with_subfolder.expected
    cd - >/dev/null
    rm -rf $SHUNIT_TMPDIR/*
}


# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
