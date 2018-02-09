FROM ubuntu:xenial

RUN mkdir /workspace

WORKDIR /workspace

# Package and dependency setup
RUN apt-get update \
    && apt-get install -y git \
    cmake \
    libboost-all-dev \
    libreadline-dev \
    mesa-common-dev \
    build-essential \
    vim curl \
    && apt-get install -y libfreetype6 libfreetype6-dev \
    && apt-get install -y wget unzip libpq-dev gfortran

ENV PYTHON_VERSION 2.7
RUN apt-get install -y python$PYTHON_VERSION python$PYTHON_VERSION-dev \
    && ln -sf /usr/bin/python2.7 /usr/bin/python \
    && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py \
    && pip install --upgrade pip \
    && pip install numpy==1.12.1 matplotlib==2.0.2 pandas==0.20.2 \
    && pip install jupyter ipython seaborn

COPY run_jupyter.sh /usr/local/bin/run_jupyter
RUN chmod +x /usr/local/bin/run_jupyter