#!/usr/bin/env bash

{
  docker-compose -f docker-compose.yml down
} || {
  sudo docker-compose -f docker-compose.yml down
}
