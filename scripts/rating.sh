#!/bin/bash
TOKEN=BAhJIiU3MmJkNmM2OTY2ZTlhZWIzODkzNzBhZDI2ZTQ2OTkzMQY6BkVG--1637fd9c9f69fd473f72b0303d0f5a5ab16f6105

curl --include --request GET http://localhost:3000/ratings \
  --header "Authorization: Token token=$TOKEN"
