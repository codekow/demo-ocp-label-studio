# Technical Notes

## Notes
- Container crashes out of the box
  - Permission denied: '/label-studio/.local'
- Not sure how it will run in `offline` mode
- Telemetry in logs makes me uncomfortable
- Improve microservice design
  - Avoid: building nginx in container
  - Use Python wsgi (gunicorn,uvicorn)
- Simplify container build
  - Complex Dockerfile
- UBI container image version lagging 
- PG Database REQUIRES `postgres` user to start
- Default data dir
  - Avoid: .local path for default
- Intuitive env variables
  - ex: LABEL_STUDIO_DB_USER, LABEL_STUDIO_DB_PASSWORD, LABEL_STUDIO_*
  - [example](https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html)
  - [current](https://labelstud.io/guide/storedata.html#PostgreSQL-database)

## TODO
- [] Patch public container to work out of the box
- [x] Use s2i source to build container