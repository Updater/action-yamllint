FROM python:alpine

ENV REVIEWDOG_VERSION=v0.14.2

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --no-cache add git

RUN pip install "cython<3.0.0" && pip install --no-build-isolation pyyaml==6.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
