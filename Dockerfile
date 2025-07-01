FROM debian:bookworm-slim

WORKDIR /

# Install necessary packages
RUN apt update && apt upgrade -y
RUN apt install sudo ssh -y
RUN service ssh start

COPY --chmod=0755 docker-entrypoint.sh .

ENTRYPOINT ["/docker-entrypoint.sh"]