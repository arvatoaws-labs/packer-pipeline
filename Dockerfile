FROM hashicorp/packer:latest as packer
FROM ghcr.io/arvatoaws-labs/sfn-ng:main as sfn-ng

FROM ghcr.io/arvatoaws/chefworkstation:current

COPY --from=packer /bin/packer /bin
COPY --from=sfn-ng /usr/bin/sfn-ng /usr/bin

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y jq awscli
