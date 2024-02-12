FROM swift:5.9-jammy

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV APP_ROOT=/workspaces/vapor-devcontainer

# Add non-root user
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

WORKDIR ${APP_ROOT}

# Set build directory permissions
RUN mkdir .build \
    && chown -R ${USER_UID}:${USER_GID} .build

USER ${USERNAME}

# Install Mint
RUN cd ${HOME} \
    && git clone https://github.com/yonaskolb/Mint.git \
    && cd Mint \
    && swift run mint install yonaskolb/mint
ENV PATH="/home/${USERNAME}/.mint/bin:${PATH}"
