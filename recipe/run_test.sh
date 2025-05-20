#!/bin/bash

# build test files
mkdir "test/build"
cd "test/build"

# these cause problems downloading test files sometimes on OSX
export CMAKE_TLS_VERIFY=0
export CMAKE_TLS_VERSION=1.0

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  ${CMAKE_ARGS} \
  ..

cmake --build .
ctest --output-on-failure

# run python tests
pytest ..


cd $SRC_DIR

# build example files
mkdir "example/build"
cd "example/build"

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  ${CMAKE_ARGS} \
  ..

cmake --build .
ctest

cd ..
python example_reader.py
python example_writer.py