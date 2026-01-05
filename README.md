# ChefAtHands — Local Database

This folder contains the local PostgreSQL database configuration and the project schema used for development and testing.

Files
- `docker-compose.yaml` — starts a PostgreSQL 16 container (`cah-postgres`) with a mapped `pgdata` volume and environment variables for DB name, user and password.
- `schema.sql` — DDL and seed data used to create tables and example rows (users, ingredients, recipes, user_ingredients, recipe_ingredients and a logging table).

Default connection details (from `docker-compose.yaml`)
- Host: `localhost`
- Port: `5432` (mapped)
- Database: `chefathands`
- User: `cah_user`
- Password: `CahStrongPass123`

Run locally (PowerShell)
1. Start the database:

```powershell
cd db
docker compose up -d
```

2. Initialize the schema (one option): copy the `schema.sql` into the container and execute it with `psql`:

```powershell
docker cp schema.sql cah-postgres:/schema.sql
docker exec -it cah-postgres bash -c "psql -U cah_user -d chefathands -f /schema.sql"
```

Alternative: use `docker exec` with stdin redirection from the host (works from Git Bash / WSL or adapt for PowerShell):

```bash
cat schema.sql | docker exec -i cah-postgres psql -U cah_user -d chefathands
```

Connect with a client
- Use DBeaver, pgAdmin, or `psql` with the default connection details above to explore tables and run queries.

Backup and restore examples
- Backup to a file on the host:

```powershell
docker exec -t cah-postgres pg_dump -U cah_user chefathands > ./chefathands_backup.sql
```

- Restore from a backup file:

```powershell
type .\chefathands_backup.sql | docker exec -i cah-postgres psql -U cah_user -d chefathands
```

Notes
- `schema.sql` contains sample test data and indexes intended for local development and testing. It is not a production migration script.
- The Postgres data directory is mounted to `db/pgdata` on the host (see `docker-compose.yaml`). Removing that folder will delete persisted data for the container.
