FROM swift:5.9-jammy

ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV APP_ROOT=/workspaces/vapor-devcontainer

# Install essential packages
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get -q update \
    && apt-get -q dist-upgrade -y \
    && apt-get -q install curl \
    && rm -rf /var/lib/apt/lists/*

# Install apple/swift-format
ENV SWIFT_FORMAT_VERSION="509.0.0"
RUN git clone https://github.com/apple/swift-format.git \
    && cd swift-format \
    && git checkout "tags/$SWIFT_FORMAT_VERSION" \
    && swift build -c release \
    && cp .build/release/swift-format /usr/local/bin/ \
    && cd .. \
    && rm -rf swift-format

# Install Reflex
RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) \
    && curl -L "https://github.com/cespare/reflex/releases/download/v0.3.1/reflex_linux_${arch}.tar.gz" -o /tmp/reflex.tar.gz \
    && tar -xzf /tmp/reflex.tar.gz -C /tmp \
    && cp /tmp/reflex_linux_${arch}/reflex /usr/local/bin/ \
    && chmod +x /usr/local/bin/reflex \
    && rm -rf /tmp/reflex.tar.gz /tmp/reflex_linux_${arch}

WORKDIR ${APP_ROOT}

# Set .build directory permissions
RUN mkdir .build \
    && chown -R ${USER_UID}:${USER_GID} .build
