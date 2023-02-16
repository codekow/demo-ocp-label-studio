# Technical Notes

## Notes
- Container crashes out of the box
  - Permission denied: '/label-studio/.local'
  - sqlite3.OperationalError: unable to open database file
- Not sure how it will run in `offline` mode
- Telemetry in logs makes me uncomfortable (community version)
  - `https://pypi.org:443 "GET /pypi/label-studio/json`
  - `[x] Get the latest news from Heidi`
  - How to disable?
- Improve microservice design
  - Avoid: building nginx in container
  - Use Python wsgi (gunicorn,uvicorn)
- Simplify container build
  - Complex Dockerfile
  - 1 process to 1 container image
- UBI container image version lagging
  - `Update available 1.6.0rc5 → 1.7.1`
- PG Database REQUIRES `postgres` user to start
- Default data dir
  - Avoid: .local path for default
- Intuitive env variables
  - ex: LABEL_STUDIO_DB_USER, LABEL_STUDIO_DB_PASSWORD, LABEL_STUDIO_*
  - [example](https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html)
  - [current](https://labelstud.io/guide/storedata.html#PostgreSQL-database)

## TODO
- [x] [Patch](container/patch/Dockerfile): public container to work out of the box
  - [x] fix: `/label-studio/.local`
  - [x] fix: `unable to open database file`
  - [x] fix: `Update available 1.6.0rc5 → 1.7.1`
- [x] Use s2i source to build container
- [ ] Review:
  - [ ] `deploy/docker-entrypoint.d/20-wait-for-db.sh`
  - [ ] `deploy/docker-entrypoint.d/30-run-db-migrations.sh`
  - [ ] `[django::register_actions_from_dir::97] [INFO] No module named 'data_manager.actions.__pycache_'`
