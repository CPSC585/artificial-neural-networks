FROM ubuntu:xenial

RUN mkdir /workspace

WORKDIR /workspace

# Package and dependency setup
RUN apt-get update \
    && apt-get install -y git apt-utils \
    cmake libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    libboost-all-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libreadline-dev libx264-dev \
    mesa-common-dev \
    build-essential libgtk-3-dev \
    vim curl gcc g++ libatlas-base-dev \
    && apt-get install -y libfreetype6 libfreetype6-dev \
    && apt-get install -y wget unzip libpq-dev gfortran

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

ENV PYTHON_VERSION 2.7
RUN apt-get install -y python$PYTHON_VERSION python$PYTHON_VERSION-dev \
    && ln -sf /usr/bin/python2.7 /usr/bin/python \
    && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py \
    && pip install --upgrade pip
RUN pip install numpy matplotlib pandas \
    && pip install jupyter jupyterlab ipython seaborn scikit-learn scikit-image
RUN pip install tensorflow keras \
    && pip install pydot graphviz  \
    && pip install plotly cufflinks nodejs npm \
    && pip install h5py imageio joblib

RUN git clone https://github.com/opencv/opencv.git \
    && cd opencv \
    && git checkout tags/3.4.0 \
    && mkdir build \ 
    && cd build \
    && cmake ../ \
    && make -j 8 \
    && make install

RUN jupyter labextension install @jupyterlab/plotly-extension

COPY run_jupyter.sh /usr/local/bin/run_jupyter
RUN chmod +x /usr/local/bin/run_jupyter

