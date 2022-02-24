#!/bin/bash
git clone https://gitee.com/szp2015/bcc.git &&
mkdir bcc/build &&
cd bcc/build &&
cmake .. &&
make &&
make install &&
cmake -DPYTHON_CMD=python3 .. &&
pushd src/python/ &&
make &&
make install &&
popd &&
rm -rf /bcc
