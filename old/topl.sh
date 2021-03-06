#!/bin/bash

FILE="$1"

echo "FILE: $FILE"

#ENCODING=$(chardet "$FILE" | cut -d\  -f 2)
ENCODING=$(chardet "$FILE" | sed -r 's|.*:\s+(.+)\s+\(.*|\1|')
echo "ENCODING: $ENCODING"

iconv -f $ENCODING -t utf-8 "$FILE" > "$FILE.temp"

sed -i " \
    s|š|ą|g; \
    s|Ľ|Ą|g; \
    s|æ|ć|g; \
    s|ê|ę|g; \
    s|³|ł|g; \
    s||ś|g; \
    s||Ś|g; \
    s||ź|g; \
    s||Ź|g; \
    s|¿|ż|g; \
    s||-|g; \
    s||\"|g; \
    s||\"|g; \
    " "$FILE.temp"

mv "$FILE.temp" "$FILE"
