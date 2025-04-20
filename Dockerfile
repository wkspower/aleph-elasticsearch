FROM elasticsearch:7.16.3
LABEL org.opencontainers.image.source = "https://github.com/wkspower/aleph-elasticsearch"

RUN bin/elasticsearch-plugin install --batch repository-s3 \
    && bin/elasticsearch-plugin install --batch repository-gcs \
    && bin/elasticsearch-plugin install --batch analysis-icu

COPY k8s-entrypoint.sh /k8s-entrypoint.sh
COPY --chown=elasticsearch synonames.txt /usr/share/elasticsearch/config/

RUN echo "discovery.type: single-node" >> /usr/share/elasticsearch/config/elasticsearch.yml

ENTRYPOINT [ "/k8s-entrypoint.sh" ]
