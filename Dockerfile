FROM golang:1.19.3-alpine3.17

LABEL maintainer="Zacharias Thorell <zachariasthorell@gmail.com>"

ARG POSTGRES_PASSWORD
ARG POST_PASSWORD

ENV PQ_PASS=${POSTGRES_PASSWORD}
ENV POST_PASS=${POST_PASSWORD}

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .

ENV PORT 8080

RUN go build

CMD ["./yogsstats"]