#!/bin/bash

separator="|"
gitmojis=(๐จ โก๏ธ ๐ฅ ๐ ๐๏ธ โจ ๐ ๐ ๐ ๐ โ ๐๏ธ ๐ ๐ ๐จ ๐ง ๐ โฌ๏ธ โฌ๏ธ ๐ ๐ท ๐ โป๏ธ โ โ ๐ง ๐จ ๐ โ๏ธ ๐ฉ โช๏ธ ๐ ๐ฆ๏ธ ๐ฝ๏ธ ๐ ๐ ๐ฅ ๐ฑ โฟ๏ธ ๐ก ๐ป ๐ฌ ๐๏ธ ๐ ๐ ๐ฅ ๐ธ ๐๏ธ ๐ฑ ๐คก ๐ฅ ๐ ๐ธ โ๏ธ ๐๏ธ ๐ท๏ธ ๐ฑ ๐ฉ ๐ฅ ๐ซ ๐๏ธ ๐ ๐ฉน ๐ง โฐ๏ธ ๐งช ๐ ๐ฉบ ๐งฑ ๐งโ๐ป ๐ธ)
emojiRegex="$( printf "${separator}%s" "${gitmojis[@]}" )"
emojiRegex="${emojiRegex:${#separator}}"

separator="|"
types=(add fix improve update remove refactor rename move upgrade downgrade)
typesRegex="$( printf "${separator}%s" "${types[@]}" )"
typesRegex="${typesRegex:${#separator}}"

message="$(cat $1)"

regex="^(${emojiRegex}) (${typesRegex}) (.*[a-z0-9]{1,})$"

if [[ ! $message =~ $regex ]];
then
  echo "-"
  echo "-"
  echo "-"
  echo "๐จ Wrong commit message! ๐"
  echo "The commit message must have this format:"
  echo "<gitmoji> <type> <description> [(#<issue number>)]"
  echo "[optional body]"
  echo "[optional footer(s)]"
  echo "-"
  echo "Should start with an emote from gitmoji and verb in imperative mood: add, fix, improve, update, remove, refactor, rename, move, upgrade, downgrade"
  echo "Example: โจ add login button"
  echo "-"
  echo "Your commit message was:"
  echo $message
  echo "-"
  echo "For more information, check script in .husky/commit-msg"
  echo "-"
  exit 1
else
  echo " "
  echo "โ๏ธ Commit message validted!"
  echo " "
fi