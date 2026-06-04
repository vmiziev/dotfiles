# Postgres via Docker

## Setup

```bash
cd ~/.config/postgres
cp .env-example .env
# edit .env with your values
```

## Usage

```bash
# Start
docker compose up -d

# Stop
docker compose down

# Stop and remove volume (destructive)
docker compose down -v

# Logs
docker compose logs -f

# Connect via psql
docker exec -it postgres psql -U $POSTGRES_USER -d $POSTGRES_DB
```

## Init scripts

Place `.sql` or `.sh` files in `./init/` — they run once on first container start (alphabetical order).
