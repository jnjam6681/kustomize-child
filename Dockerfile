# FROM golang:1.18 as builder
# WORKDIR /code
# COPY main.go .
# COPY go.* .
# RUN go mod download
# # `skaffold debug` sets SKAFFOLD_GO_GCFLAGS to disable compiler optimizations
# ARG SKAFFOLD_GO_GCFLAGS
# RUN go build -gcflags="${SKAFFOLD_GO_GCFLAGS}" -trimpath -o /app main.go

# FROM alpine:3.10
# # Define GOTRACEBACK to mark this container as using the Go language runtime
# # for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
# ENV GOTRACEBACK=single
# CMD ["./app"]
# COPY --from=builder /app .



FROM golang:1.18-alpine as builder
WORKDIR /app
COPY go.* .
RUN go mod download
COPY *.go .
ARG SKAFFOLD_GO_GCFLAGS
ARG TARGETOS
ARG TARGETARCH
# RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -gcflags="${SKAFFOLD_GO_GCFLAGS}" -trimpath -o /app main.go
RUN CGO_ENABLED=0 GOOS=linux go build -gcflags="${SKAFFOLD_GO_GCFLAGS}" -trimpath -o goapp main.go

FROM alpine:3.13.1
WORKDIR /app
ENV GOTRACEBACK=single
# RUN apk add --no-cache ca-certificates
COPY --from=builder /app/goapp ./goapp
EXPOSE 1323
CMD ["./goapp"]
