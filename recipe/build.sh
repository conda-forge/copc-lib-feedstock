#!/bin/bash

set -ex

mkdir build
cd build

#if [ "$target_platform" = "osx-arm64" ]; then
#  export SKBUILD_CONFIGURE_OPTIONS=${CMAKE_ARGS/CMAKE_INSTALL_PREFIX/CMAKE_INSTALL_PREFIX_BAK}
#  export CMAKE_OSX_ARCHITECTURES="arm64"
#fi

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DWITH_TESTS=OFF \
  -DWITH_PYTHON=OFF \
  ${CMAKE_ARGS} \
  ..

cmake --build .
cmake --install .

cd $SRC_DIR

#git clone --depth 1 --branch 3.0.0 https://github.com/hobu/laz-perf.git libs/laz-perf
$PYTHON setup.py install
