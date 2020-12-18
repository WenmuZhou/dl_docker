FROM nvidia/cuda:10.1-cudnn8-devel-ubuntu18.04
LABEL maintainer "zhoujun"

RUN apt-get update \
&& apt install -y libglib2.0-0 libsm6 libxrender1 libxext-dev vim tmux htop \
&& apt-get install -y software-properties-common curl \
&& apt autoremove -y \
&& apt-get install -y python3 python3-dev python3-pip \
&& apt-get install -y build-essential
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python3-tk
WORKDIR /

COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir torch==1.5.1+cu101 torchvision==0.6.1+cu101 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install --no-cache-dir -r requirements.txt && rm requirements.txt
ENV LANG C.UTF-8
