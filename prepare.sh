#!/bin/sh

export ONNX_ML=0
export CMAKE_ARGS="-DONNX_USE_PROTOBUF_SHARED_LIBS=ON"
export SETUPTOOLS_ENABLE_FEATURES="legacy-editable"
export DEBUG=1

echo Installing ONNX
pip install -e .
echo ONNX installed

echo Generating data
python onnx/backend/test/cmd_tools.py generate-data --clean
echo Data generated

echo Generating docs
python onnx/defs/gen_doc.py
echo Docs generated

echo Generating test coverage
python onnx/backend/test/stat_coverage.py
echo Test coverage generated
