FROM debian:stable-slim AS download

ENV VERSION="0.3.11"

RUN apt update && apt install -y wget

WORKDIR /opt

RUN wget https://github.com/matrix-org/dendrite/archive/refs/tags/v$VERSION.tar.gz

RUN tar xfz v$VERSION.tar.gz && mv dendrite-$VERSION dendrite

FROM golang AS build

WORKDIR /go/src/app

COPY --from=download /opt/dendrite .
#COPY ./dendrite-$VERSION .

RUN ./build.sh

FROM debian:stable-slim

WORKDIR /opt/

COPY --from=build /go/src/app/bin/* /bin/
COPY ./start.sh /bin/start.sh

CMD ["start.sh"]
