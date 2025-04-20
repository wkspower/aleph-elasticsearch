TAG=v1.0.0

all: push

build:
	docker build -t ghcr.io/wkspower/aleph-elasticsearch:$(TAG) .

run: build
	docker run -ti -e ES_JAVA_OPTS="-Xms720m -Xmx720m" ghcr.io/wkspower/aleph-elasticsearch:$(TAG) bash

exec: build
	docker run -ti -e ES_JAVA_OPTS="-Xms720m -Xmx720m" -v $(PWD)/secrets:/secrets ghcr.io/wkspower/aleph-elasticsearch:$(TAG)

push: build
	docker push ghcr.io/wkspower/aleph-elasticsearch:$(TAG)
