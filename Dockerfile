FROM durosoft/crystal-alpine:latest

COPY . .

RUN crystal build main.cr -o build
CMD ./build