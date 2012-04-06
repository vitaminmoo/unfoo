
#
# Testing
#
test: test-clean
	(cd tests && sh runner -s /bin/bash)

test-clean:
	rm -rf tests/results

.PHONY: test test-clean
