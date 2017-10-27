#!/bin/sh
set -ex

# Clone unpublished craft-dart packages
git clone https://github.com/craft-dart/craft-type.git ../craft-type
git clone https://github.com/craft-dart/craft-element.git ../craft-element
git clone https://github.com/craft-dart/craft-element-test.git ../craft-element-test

# Get version
dart --version

# Get dependencies
pub install

# Verify that the libraries are error and warning-free.
dartanalyzer ${DARTANALYZER_FLAGS} $(ls -rt lib/*.dart)

# Run the tests
pub run test
