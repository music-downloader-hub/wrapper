FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y wget && \
    wget "https://github.com/zhaarey/wrapper/releases/download/linux.V2/wrapper.x86_64.tar.gz" && \
    mkdir wrapper && \
    tar -xzf wrapper.x86_64.tar.gz -C wrapper && \
    rm wrapper.x86_64.tar.gz && \
    apt-get remove -y wget && \
    apt-get clean

COPY . /app

ENV args ""

CMD ["bash", "-c", "cd wrapper && ./wrapper ${args}"]

EXPOSE 10020 20020