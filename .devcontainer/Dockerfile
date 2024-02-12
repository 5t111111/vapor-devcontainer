FROM swift:5.9-jammy

ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV APP_ROOT=/workspaces/vapor-devcontainer

# Install apple/swift-format
ENV SWIFT_FORMAT_VERSION="509.0.0"
RUN git clone https://github.com/apple/swift-format.git \
    && cd swift-format \
    && git checkout "tags/$SWIFT_FORMAT_VERSION" \
    && swift build -c release \
    && cp .build/release/swift-format /usr/local/bin/

WORKDIR ${APP_ROOT}

# Set .build directory permissions
RUN mkdir .build \
    && chown -R ${USER_UID}:${USER_GID} .build
