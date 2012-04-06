#! /bin/sh

# load test helpers
. ./test_helpers


test_single_file() {
    for name in tar tar.gz tar.bz2 tar.lzma tar.xz ace rar zip 7z
    do
        echo "Testing .${name}"
        extract_archive $name
    done
}
extract_archive() {
    ext=$1
    cd $SHUNIT_TMPDIR
    $PROGRAM $FIXTURES/single_file.${ext} > /dev/null
    result_val=$?
    find . | grep -v find.out | sort > find.out

    assertTrue $result_val
    assertOutputSame find.out ${OUTPUT}/single_file.expected
    cd - >/dev/null
    rm -rf $SHUNIT_TMPDIR/*
}

# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
