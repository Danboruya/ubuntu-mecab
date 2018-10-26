FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y mecab \
    && apt-get install -y libmecab-dev \
    && apt-get install -y mecab-ipadic-utf8\
    && apt-get install -y git\
    && apt-get install -y make\
    && apt-get install -y curl\
    && apt-get install -y xz-utils\
    && apt-get install -y file\
    && apt-get install -y sudo\
    && apt-get install -y wget\
    && apt-get install -y build-essential

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git\
    && cd mecab-ipadic-neologd\
    && bin/install-mecab-ipadic-neologd -n -y

COPY ./CRF++-0.58.tar.gz ./
RUN tar zxf CRF++-0.58.tar.gz \
    && cd CRF++-0.58 \
    && ./configure \
    && make \
    && make install \
    && ldconfig

COPY ./cabocha-0.69.tar.bz2 ./
RUN tar jxvf cabocha-0.69.tar.bz2 \
    && cd cabocha-0.69 \
    && ./configure -with-charset=utf8 \
    && make \
    && make install \
    && ldconfig

RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN python3.6 -m pip install pip --upgrade

RUN pip install flask
RUN pip install numpy
RUN pip install pandas
RUN pip install sklearn
RUN pip install gensim
RUN pip install mecab-python3
