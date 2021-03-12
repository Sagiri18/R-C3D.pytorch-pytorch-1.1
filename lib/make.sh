#!/usr/bin/env bash

export CPATH=/usr/local/cuda/include
export CUDA_PATH=/usr/local/cuda/
export PATH=/usr/local/cuda/bin/:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

export CXXFLAGS="-std=c++11"
export CFLAGS="-std=c99"


#python setup.py build_ext --inplace
#rm -rf build

CUDA_ARCH="-gencode arch=compute_75,code=sm_75 "

# compile NMS
echo "Building nms op..."
%cd /content/R-C3D.pytorch-pytorch-1.1/lib/model/nms
if [ -d "build" ]; then
    rm -r build
fi
python /content/R-C3D.pytorch-pytorch-1.1/lib/model/nms/setup.py build_ext --inplace

# compile roi_temporal_pool
echo "Building roi_temporal_pool"
%cd /content/R-C3D.pytorch-pytorch-1.1/lib/model/roi_temporal_pool
if [ -d "build" ]; then
    rm -r build
fi
python /content/R-C3D.pytorch-pytorch-1.1/lib/model/roi_temporal_pool/setup.py build_ext --inplace
