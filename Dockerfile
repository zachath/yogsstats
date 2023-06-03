FROM golang:1.19.3-alpine3.17 as builder

WORKDIR /build

COPY . .

RUN go mod download && \
 go build -o yogsstats

FROM alpine:latest

ARG POSTGRES_PASSWORD
ARG POST_PASSWORD
ARG HOST_IP

ENV PQ_PASS=${POSTGRES_PASSWORD}
ENV POST_PASS=${POST_PASSWORD}
ENV HOST=${HOST_IP}

WORKDIR /app

COPY --from=builder /build/yogsstats yogsstats

COPY --from=builder /build/input.html input.html

ENV PORT 5000

CMD ["/app/yogsstats"]