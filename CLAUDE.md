# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Stack

Rust + Tokio + Axum + SQLx + PostgreSQL.

## Commands

```bash
# Build
cargo build

# Run
cargo run

# Tests
cargo test

# Run a single test
cargo test test_name

# Check (faster than build, no binary)
cargo check

# Lint
cargo clippy

# Format
cargo fmt

# SQLx migrations
sqlx migrate run
sqlx migrate revert

# SQLx prepare (update offline query cache)
cargo sqlx prepare
```

## Architecture

To be documented as the project grows.
