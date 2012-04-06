#! /bin/sh

# load test helpers
. ./test_helpers


test_no_folder() {
    for name in tar tar.gz tar.bz2 tar.lzma tar.xz ace rar zip 7z
    do
        echo "Testing ${name}"
        extract_archive $name
    done
}
extract_archive() {
    ext=$1
    cd $SHUNIT_TMPDIR
    $PROGRAM $FIXTURES/no_folder.${ext} > /dev/null
    result_val=$?
    find no_folder | sort > find.out

    assertTrue $result_val
    assertOutputSame find.out ${OUTPUT}/no_folder.expected
    cd - >/dev/null
    rm -rf $SHUNIT_TMPDIR/*
}

# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
