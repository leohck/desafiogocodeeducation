FROM golang:latest as builder
WORKDIR /go
COPY ./app .
RUN go build hello.go
RUN mkdir /app
RUN mv hello /app

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./hello" ]