FROM durosoft/crystal-alpine:latest

COPY . .

RUN shards install

RUN mkdir build

RUN crystal build main.cr -o build/server

