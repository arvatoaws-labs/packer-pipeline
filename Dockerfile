FROM hashicorp/packer:1.4.2 as packer
FROM ghcr.io/arvatoaws-labs/sfn-ng:main as sfn-ng

FROM chef/chefdk:4.8.38

COPY --from=packer /bin/packer /bin
COPY --from=sfn-ng /usr/bin/sfn-ng /usr/bin

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y jq awscli