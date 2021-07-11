#!/data/data/com.termux/files/usr/bin/bash
. "$SCRIPT_DIR/tools/util.sh"
echo "$SCRIPT_DIR"
api="https://old.reddit.com/r/${sub}/${sort}.json"
res=$(curl -s -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" "$api")
posts=25
rand=$(get_random_number "$posts")
url=$(echo "$res" | jq --raw-output ".data.children[$rand].data.url")
while [[ $url == *"/gallery/"* ]]
do
  rand=$(get_random_number "$posts")
  url=$(echo "$res" | jq --raw-output ".data.children[$rand].data.url")
done
echo "$url"