# Commands used for demo env

```bash
docker run -e POSTGRES_PASSWORD=teste -p 5432:5432 postgres

typesense-server -d /tmp/whatever --api-key teste

docker run -p 6379:6379  redis


NODE_ENV=development TYPESENSE_API_KEY="teste" DB_USERNAME=postgres DB_PASSWORD=teste DB_DATABASE_NAME=postgres TYPESENSE_ENABLED=false ./result/bin/immich microservices

REDIS_HOSTNAME=localhost NODE_ENV=development TYPESENSE_API_KEY="teste" DB_USERNAME=postgres DB_PASSWORD=teste DB_DATABASE_NAME=postgres TYPESENSE_ENABLED=false  ./result/bin/immich immich
```

It creates some state data so maybe it's better to chdir the binaries to /var/lib when setting up the modules part
