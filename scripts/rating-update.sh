#!/bin/bash
ID=2
TOKEN=BAhJIiUyOWI3OGMzYTM4NjlmZTBhMGFiOTgwY2ZjYTkzZTQ5MgY6BkVG--003a27ec7b8c22e5e3ce57223d29c4f67e099e94

curl --include --request PATCH http://localhost:3000/ratings/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "rating": {
      "score": "1",
      "user_id": "2",
      "topic_id": "1"
    }
  }'
