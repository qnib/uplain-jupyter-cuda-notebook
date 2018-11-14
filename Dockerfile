ARG FROM_IMG_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-jupyter-scipy-notebook
ARG FROM_IMG_TAG=2018-11-14.1
ARG FROM_IMG_HASH=''
FROM ${FROM_IMG_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

USER root
ENV NV_CUDA_VER=9.2
ARG NV_URL=http://developer.download.nvidia.com/compute/cuda

RUN apt-get update \
 && apt-get install -y wget
RUN echo ">> Download: ${NV_URL}/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.148-1_amd64.deb" \
 && wget -qO /tmp/cuda-repo.deb ${NV_URL}/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.148-1_amd64.deb \
 && dpkg -i /tmp/cuda-repo.deb \
 && rm -f /tmp/cuda-repo.deb
#RUN echo ">> Download: ${NV_URL}/${NV_CUDA_VER}/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb" \
# && wget -qO /tmp/cuda-blas-update.deb ${NV_URL}/${NV_CUDA_VER}/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb \
# && dpkg -i /tmp/cuda-blas-update.deb \
# && rm -f /tmp/cuda-blas-update.deb
RUN apt-get update \
 && apt-get install --allow-unauthenticated -y cuda
