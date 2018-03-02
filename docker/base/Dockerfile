FROM ubuntu:xenial

RUN mkdir /workspace

WORKDIR /workspace

# Package and dependency setup
RUN apt-get update \
    && apt-get install -y git apt-utils \
    cmake \
    libboost-all-dev \
    libreadline-dev \
    mesa-common-dev \
    build-essential \
    vim curl \
    && apt-get install -y libfreetype6 libfreetype6-dev \
    && apt-get install -y wget unzip libpq-dev gfortran

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

ENV PYTHON_VERSION 2.7
RUN apt-get install -y python$PYTHON_VERSION python$PYTHON_VERSION-dev \
    && ln -sf /usr/bin/python2.7 /usr/bin/python \
    && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py \
    && pip install --upgrade pip \
    && pip install numpy matplotlib pandas \
    && pip install jupyter jupyterlab ipython seaborn scikit-learn scikit-image \
    && pip install tensorflow keras \
    && pip install pydot graphviz \
    && pip install plotly cufflinks nodejs npm

RUN jupyter labextension install @jupyterlab/plotly-extension

COPY run_jupyter.sh /usr/local/bin/run_jupyter
RUN chmod +x /usr/local/bin/run_jupyter

