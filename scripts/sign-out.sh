#!/bin/bash
ID=1
TOKEN=BAhJIiVlNTc4M2Y4ZGI1M2U1ZDhjNGQ0ZTJhMzMwZmViZDZkZAY6BkVG--152e7606fee3bd1a5f09e7dfca3e44360dd1c247

curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
