#!/usr/bin/env bash
docker stack deploy --with-registry-auth --compose-file docker-compose-mysql.yml xp_deve
