#
# Created by Jugal Kishore -- 2022
#
# Docker Image for Broken Link Checker
FROM alpine:latest AS builder

RUN apk add --no-cache curl jq

WORKDIR /app

# Fetch latest lychee release from GitHub API and download musl binary
RUN VERSION=$(curl -s https://api.github.com/repos/lycheeverse/lychee/releases/latest | jq -r '.tag_name') && \
    ARCH="$(arch)" && \
    curl -sLo lychee.tar.gz https://github.com/lycheeverse/lychee/releases/download/${VERSION}/lychee-${ARCH}-unknown-linux-musl.tar.gz && \
    tar -xf lychee.tar.gz && \
    chmod +x lychee

FROM alpine:latest AS runner

RUN apk add --no-cache ca-certificates

RUN addgroup -S appuser && adduser -S -G appuser appuser

COPY --from=builder /app/lychee /usr/local/bin/lychee

USER appuser

ENTRYPOINT [ "lychee" ]
CMD ["--help"]
