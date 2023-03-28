#!/bin/bash

hello() {
  echo "hello"
  echo "hello $1"
}

hello "$1"