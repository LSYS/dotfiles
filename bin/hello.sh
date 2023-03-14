#!/bin/bash -x

hello() {
	echo "hello"
	echo "hello $1"
	# return 1
}

hello "$1"