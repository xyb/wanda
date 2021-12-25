#!/data/data/com.termux/files/usr/bin/bash

. "./wanda.sh"
mkdir -p "./etc"
mkdir -p "./tmp"
touch "./tmp/temp.json"

failed=0

contains() {
  if [[ $1 == *"$2"* ]]; then
    echo "pass"
    return 0
  else
    echo "fail a:[$1] e:[$2] "
    return 1
  fi
}

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "wallhaven tests"
contains "$(wallhaven)" "https://w.wallhaven.cc/full/"
failed=$((failed + $?))
sleep 3
contains "$(wallhaven "$(encode "eiffel tower")")" "https://w.wallhaven.cc/full/"
failed=$((failed + $?))
sleep 3
contains "$(wallhaven "noresults123")" "null"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "unsplash tests"
contains "$(unsplash)" "https://images.unsplash.com/photo-"
failed=$((failed + $?))
sleep 3
contains "$(unsplash "$(encode "eiffel tower")")" "https://images.unsplash.com/photo-"
failed=$((failed + $?))
sleep 3
contains "$(unsplash "noresults123")" "https://images.unsplash.com/source-404"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "reddit tests"
contains "$(reddit)" "https://i.redd.it/"
failed=$((failed + $?))
sleep 3
contains "$(reddit "$(encode "eiffel tower")")" "https://i.redd.it/"
failed=$((failed + $?))
sleep 3
contains "$(reddit "noresults123")" "null"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "imgur tests"
contains "$(imgur)" "https://i.imgur.com/"
failed=$((failed + $?))
sleep 3
contains "$(imgur "XlfFj3g")" "https://i.imgur.com/"
failed=$((failed + $?))
sleep 3
contains "$(imgur "noresults123")" "No results"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "artstation tests"
contains "$(artstation)" "artstation.com/p/assets/images/images/"
failed=$((failed + $?))
sleep 3
contains "$(artstation "huniartist")" "artstation.com/p/assets/images/images/"
failed=$((failed + $?))
sleep 3
contains "$(artstation "noresults123")" "No results"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo "4chan tests"
contains "$(fourchan)" "i.4cdn.org"
failed=$((failed + $?))
sleep 3
contains "$(fourchan "https://boards.4chan.org/wg/thread/6872254")" "i.4cdn.org"
failed=$((failed + $?))
sleep 3
contains "$(fourchan "noresults123")" "No results"
failed=$((failed + $?))
sleep 3
echo ""

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

echo ""
rm -rf "./etc"
rm -rf "./tmp"
echo "$failed tests failed"
exit $failed