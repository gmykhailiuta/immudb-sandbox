# Immudb test application

Provide a simple way to run immudb alongside with immudb-py SDK.
Inserts 1000 key/value pairs into DB.


## Requirements (version tested on):

- Linux (Arch)
- Docker (20.10.12)
- Docker Compose (2.2.2)

## Running

```
docker-compose up
```

## TODO

1. Tests. Although the code reads the key value just after it has stored one, it can't be considered as a full-featured test.
2. Immudb replication/
3. Add persistent storage
