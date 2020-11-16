FROM hashicorp/packer:1.4.2 as packer

FROM chef/chefdk:4.8.38

COPY --from=packer /bin/packer /bin

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y jq awscli