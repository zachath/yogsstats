FROM golang:1.19.3-alpine3.17

LABEL maintainer="Zacharias Thorell <zachariasthorell@gmail.com>"

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .

ENV PORT 5002

RUN go build

CMD ["./yogsstats-frontend"]