FROM durosoft/crystal-alpine:latest

COPY . .

RUN shards install

RUN crystal build main.cr -o server

