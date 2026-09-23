ARG VALKEY_VERSION="9"

FROM dhi.io/valkey:${VALKEY_VERSION}

COPY ./config/valkey/valkey.conf /usr/local/valkey/valkey.conf
COPY --chmod=755 entrypoints/valkey.sh /usr/local/bin/entrypoint.sh

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
    CMD valkey-cli -a "$(cat /run/secrets/valkey_password)" ping | grep -q PONG

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
