FROM durosoft/crystal-alpine:latest

COPY . .

RUN shards install

RUN mkdir -p build

RUN crystal build main.cr -o build/server

