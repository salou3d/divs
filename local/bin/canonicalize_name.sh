#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "No file or directory provided"
  echo "Usage: $0 file1 [file2 [...]]"
  exit 1
else
  for i in "$@"; do
    if [ -f "$i" -o -d "$i" ]; then
      j=$(echo "$i" | awk '{gsub(/[:!?~]/, ""); print}')
      if [ "$i" != "$j" ]; then
        mv -v "$i" "$j"
      fi
    fi
  done
fi
