FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    software-properties-common

RUN apt-get install -y libboost-all-dev

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3.8-dev python3-pip
    
RUN wget https://mirrors.kernel.org/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb && \
    apt-get install -y ./libffi6_3.2.1-8_amd64.deb && \
    rm libffi6_3.2.1-8_amd64.deb

RUN wget https://github.com/souffle-lang/souffle/releases/download/2.0.2/souffle_2.0.2-1_amd64.deb && \
    apt-get install -y ./souffle_2.0.2-1_amd64.deb && \
    rm souffle_2.0.2-1_amd64.deb

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["/bin/bash"]
