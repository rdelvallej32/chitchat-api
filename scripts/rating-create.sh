#!/bin/bash
TOKEN=BAhJIiUyOWI3OGMzYTM4NjlmZTBhMGFiOTgwY2ZjYTkzZTQ5MgY6BkVG--003a27ec7b8c22e5e3ce57223d29c4f67e099e94

curl --include --request POST http://localhost:3000/ratings \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "rating": {
      "score": "4",
      "user_id": "2",
      "topic_id": "3"
    }
  }'
