FROM golang:1.19.3-alpine3.17

LABEL maintainer="Zacharias Thorell <zachariasthorell@gmail.com>"

ARG POSTGRES_PASSWORD
ARG POST_PASSWORD
ARG HOST_IP

ENV PQ_PASS=${POSTGRES_PASSWORD}
ENV POST_PASS=${POST_PASSWORD}
ENV HOST=${HOST_IP}

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .

ENV PORT 8080

RUN go build

CMD ["./yogsstats"]