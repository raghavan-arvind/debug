FROM alpine:3.14

# install aws cli latest version
RUN apk --no-cache add \
    python3 \
    py3-pip \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir awscli

# install jq
RUN apk --no-cache add jq

# install curl
RUN apk --no-cache add curl

# install dig
RUN apk --no-cache add bind-tools

# install ripgrep
RUN apk --no-cache add ripgrep

# install neovim
RUN apk --no-cache add neovim

# alias vim to nvim
RUN ln -s /usr/bin/nvim /usr/bin/vim

# wait in loop forever
CMD ["tail", "-f", "/dev/null"]
