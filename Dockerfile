from golang:1.15.2-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PROTOC_VERSION 3.13.0
ENV NODE_VERSION=12.18.3
# ENV GO_VERSION 1.15.1

COPY generate_go_server.sh /
COPY generate_client.sh /

RUN apt-get update
RUN apt-get -y install wget unzip npm git

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
RUN unzip protoc-3.13.0-linux-x86_64.zip

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN npm i -g grpc-web

RUN go get github.com/gogo/protobuf/protoc-gen-gofast
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc

WORKDIR /workspace
# RUN echo "gopath is ${GOPATH}"
RUN go get github.com/gogo/protobuf/protoc-gen-gofast
ENTRYPOINT /generate_go_server.sh && /generate_client.sh
