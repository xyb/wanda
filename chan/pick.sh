#!/data/data/com.termux/files/usr/bin/bash
. ./chan/config
image_host="https://i.4cdn.org/${board}/"
api="https://a.4cdn.org/${board}/thread/${thread}.json"
res=$(curl -s $api)
posts=$(echo $res | jq '.[] | length')
rand=$(shuf -i 1-$posts -n 1)
post_image=$(echo $res | jq ".[][$rand].tim")
while [ $post_image = "null" ]
do
  rand=$(shuf -i 1-$posts -n 1)
  post_image=$(echo $res | jq ".[][$rand].tim")
done
post_exten=$(echo $res | jq  --raw-output ".[][$rand].ext")
url="${image_host}${post_image}${post_exten}"
echo $url