LOCAL_NAME=torch-nv
VERSION=cuda8.0-cudnn5-devel-ubuntu14.04
PUBLIC_NAME=torch-nv
REPOSITORY=bfolkens


.PHONY: all build tag release

all: build

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

