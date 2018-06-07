FROM golang:latest

COPY ./scripts/bootstrap /scripts/bootstrap
RUN /scripts/bootstrap
COPY . /goroot/src/github.com/bloomapi/external-dns
WORKDIR /goroot/src/github.com/bloomapi/external-dns
ENV GOPATH /goroot
RUN go get
RUN go install

ENTRYPOINT ["/goroot/bin/external-dns"]