#!/bin/bash

USER="$1"

DATA=$(curl -s "https://api.github.com/users/$USER")

if [[ $(echo "$DATA" | jq -r '.message') == "Not Found" ]]; then
exit 1
fi

REPOS=$(echo "$DATA" | jq -r '.public_repos')
FOLLOWERS=$(echo "$DATA" | jq -r '.followers')

echo "<p>$(date) | User: $USER | Repositories: $REPOS | Followers: $FOLLOWERS</p>" >> /var/www/html/index.html
