FROM golang:1.15.2-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PROTOC_VERSION 3.13.0
ENV NODE_VERSION=12.18.3
ENV GRPC_WEB_VERSION=1.2.1

COPY generate.sh /

RUN apt-get update
RUN apt-get -y install wget unzip npm git

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
RUN unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip

RUN go get github.com/gogo/protobuf/protoc-gen-gofast
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc
RUN wget https://github.com/grpc/grpc-web/releases/download/${GRPC_WEB_VERSION}/protoc-gen-grpc-web-${GRPC_WEB_VERSION}-linux-x86_64
RUN chmod +x protoc-gen-grpc-web-${GRPC_WEB_VERSION}-linux-x86_64
RUN mv protoc-gen-grpc-web-${GRPC_WEB_VERSION}-linux-x86_64 protoc-gen-grpc-web
RUN cp protoc-gen-grpc-web /bin

WORKDIR /workspace

ENTRYPOINT /generate.sh
