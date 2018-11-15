ARG FROM_IMG_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-jupyter-scipy-notebook
ARG FROM_IMG_TAG=2018-11-14.1
ARG FROM_IMG_HASH=''
FROM ${FROM_IMG_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

USER root
ARG NV_URL=http://developer.download.nvidia.com/compute/cuda
ARG NV_DEB=ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
RUN apt-get update \
 && apt-get install -y wget
RUN echo ">> Download: ${NV_URL}/repos/${NV_DEB}" \
 && wget -qO /tmp/cuda-repo.deb ${NV_URL}/repos/${NV_DEB} \
 && dpkg -i /tmp/cuda-repo.deb \
 && rm -f /tmp/cuda-repo.deb
RUN apt-get update \
 && apt-get install --allow-unauthenticated -y cuda
