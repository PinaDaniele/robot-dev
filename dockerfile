FROM ros:jazzy

RUN apt-get update \
    && apt-get install -y --no-install-recommends git python3-serial socat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ws
CMD ["bash"]
