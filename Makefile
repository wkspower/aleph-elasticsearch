TAG=latest

all: push

build:
	docker build -t wkspower/aleph-elasticsearch:$(TAG) .

run: build
	docker run -ti wkspower/aleph-elasticsearch:$(TAG) bash

exec: build
	docker run -ti -v $(PWD)/secrets:/secrets wkspower/aleph-elasticsearch:$(TAG)

push: build
	docker push wkspower/aleph-elasticsearch:$(TAG)
