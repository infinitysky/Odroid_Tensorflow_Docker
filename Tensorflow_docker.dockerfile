FROM arm32v7/ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get -y –allow-unauthenticated upgrade
RUN apt-get install -y –allow-unauthenticated pkg-config zip g++ zlib1g-dev unzip wget curl libstdc++6
RUN apt-get install libhdf5-serial-dev hdf5-tools
RUN apt-get install pkg-config zip g++ zlib1g-dev unzip wget curl -y
RUN apt-get install gcc-4.8 g++-4.8 -y
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100

RUN apt-get install python-pip python-numpy swig python-dev -y
RUN apt-get install python3-pip python3-numpy python3-dev -y

RUN cd /root

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN python3 get-pip.py

RUN wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v1.11.0/tensorflow-1.11.0-cp27-none-linux_armv7l.whl
RUN wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v1.11.0/tensorflow-1.11.0-cp35-none-linux_armv7l.whl

RUN pip2 install h5py six numpy wheel mock
RUN pip3.5 install h5py six numpy wheel mock

RUN pip2 install ./tensorflow-1.11.0-cp27-none-linux_armv7l.whl
RUN pip3.5 install ./tensorflow-1.11.0-cp35-none-linux_armv7l.whl