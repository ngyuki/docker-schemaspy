# docker-schemaspy

- [ngyuki/schemaspy \- Docker Hub](https://hub.docker.com/r/ngyuki/schemaspy)

## Usage

Use docker command.

```sh
docker run --rm -v "$PWD:/work" -w /work ngyuki/schemaspy \
  -o schemaspy/ -t mysql -host mysql:3306 -u root -db dbname -s dbname
```

Use Gitlab CI.

```yaml
schemaspy:
  stage: build
  image: ngyuki/schemaspy
  services:
    - name: mysql
      command:
        - --default_authentication_plugin=mysql_native_password
  variables:
    MYSQL_DATABASE: dbname
    MYSQL_ALLOW_EMPTY_PASSWORD: 1
  script:
    - mysql -h mysql -u root dbname < db.sql
    - schemaspy -o schemaspy/ -t mysql -host mysql:3306 -u root -db dbname -s dbname
  artifacts:
    paths:
      - schemaspy/
    expire_in: 30 days
    expose_as: schemaspy
```