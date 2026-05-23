set dotenv-load := true

# показать все команды
default:
    @just --list

# --- инфраструктура ---

# поднять БД и RabbitMQ (без сервисов)
up:
    docker compose up -d postgres rabbitmq

# поднять всё включая сервисы
up-all:
    docker compose up -d

# остановить всё
down:
    docker compose down

# остановить и удалить данные
down-clean:
    docker compose down -v

# --- база данных ---

# накатить миграции
migrate:
    sqlx migrate run

# откатить последнюю миграцию
migrate-revert:
    sqlx migrate revert

# залить тестовые данные
seed:
    docker compose exec -T postgres psql -U endless_funeral -d endless_funeral -f - < scripts/seed.sql

# обновить sqlx offline кэш
sqlx-prepare:
    cargo sqlx prepare --workspace

# --- разработка ---

# запустить сервис локально
dev service="graveyard":
    cargo run -p {{service}}

# --- сборка и проверки ---

# собрать весь workspace
build:
    cargo build --workspace

# проверить без сборки бинарников
check:
    cargo check --workspace

# форматировать код
fmt:
    cargo fmt --all

# линтер
clippy:
    cargo clippy --workspace

# --- всё сразу для старта ---

# первый запуск: поднять инфру, накатить миграции, залить данные
bootstrap:
    just up
    @echo "Waiting for postgres..."
    @sleep 2
    just migrate
    just seed
