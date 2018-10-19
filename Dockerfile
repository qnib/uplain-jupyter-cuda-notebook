ARG FROM_IMG_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-jupyter-scipy-notebook
ARG FROM_IMG_TAG=2018-10-18.1
ARG FROM_IMG_HASH=''
FROM ${FROM_IMG_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

USER root
ENV DEBIAN_FRONTEND=noninteractive
ENV NV_CUDA_VER=9.0
ARG NV_URL=http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/
ARG NV_CUDA_FILE=cuda-repo-ubuntu1604_9.2.148-1_amd64.deb
RUN apt-get update \
 && apt-get install -y wget gnupg
RUN echo ">> Download: ${NV_URL}/${NV_CUDA_FILE}" \
 && wget -O /tmp/cuda-repo.deb ${NV_URL}/${NV_CUDA_FILE} \
 && dpkg -i /tmp/cuda-repo.deb \
 && rm -f /tmp/cuda-repo.deb
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub \
 && apt-get update \
 && apt-get install -y cuda
