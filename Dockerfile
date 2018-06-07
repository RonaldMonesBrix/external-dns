FROM golang as builder

WORKDIR /go/src/github.com/RonaldMonesBrix/external-dns
COPY . .
RUN make dep
RUN make test
RUN make build

COPY --from=builder /go/src/github.com/RonaldMonesBrix/external-dns/build/external-dns /bin/external-dns

ENTRYPOINT ["/bin/external-dns"]