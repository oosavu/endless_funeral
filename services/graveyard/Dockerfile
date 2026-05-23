FROM rust:1.95 AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./
COPY shared/ shared/
COPY services/graveyard/ services/graveyard/
COPY .sqlx/ .sqlx/

ENV SQLX_OFFLINE=true

RUN cargo build --release --bin graveyard

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libssl3 ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/graveyard /usr/local/bin/graveyard

CMD ["graveyard"]
