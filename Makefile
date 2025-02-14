GOPATH:=$(shell go env GOPATH)
.PHONY: build
build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o grpc-mesh main.go

.PHONY: test
test:
	go test -v ./... -cover

.PHONY: docker
docker:
	docker build . -t shanlongpan/grpc-mesh:1.1

.PHONY: docker-push
docker-push:
	docker push shanlongpan/grpc-mesh:1.1
docker-image-tar:
	docker save shanlongpan/grpc-mesh:1.1>grpc-mesh.tar