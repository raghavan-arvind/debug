FROM alpine:3.14

RUN apk --no-cache add \
    python3 \
    py3-pip \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir awscli

RUN apk --no-cache add jq
RUN apk --no-cache add curl
RUN apk --no-cache add bind-tools
RUN apk --no-cache add ripgrep
RUN apk --no-cache add postgresql-client
RUN apk --no-cache add bash
RUN apk --no-cache add neovim
RUN apk --no-cache add hey

RUN ln -s /usr/bin/nvim /usr/bin/vim

CMD ["tail", "-f", "/dev/null"]
