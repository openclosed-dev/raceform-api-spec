FROM node:26-trixie

ARG USERNAME
ARG USER_UID
ARG USER_GID=$USER_UID

RUN userdel -r node \
  && groupadd -g ${USER_GID} ${USERNAME} \
  && useradd -u ${USER_UID} -g ${USER_GID} -m -s /bin/bash ${USERNAME}

RUN DEBIAN_FRONTEND=noninteractiv apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    git \
    make \
    openssh-client \
    unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN mkdir -p .claude .npm-global
RUN npm config set prefix '~/.npm-global'

ARG REDOCLY_CLI_VERSION
ARG CLAUDE_CODE_VERSION

RUN npm install -g @redocly/cli@${REDOCLY_CLI_VERSION}
RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}

ENV PATH=/home/${USERNAME}/.npm-global/bin:$PATH
ENV CLAUDE_CONFIG_DIR=/home/${USERNAME}/.claude
