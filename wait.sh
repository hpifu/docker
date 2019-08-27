#!/bin/bash

if [ "$#" -lt 2 ]; then
  echo "Usage: wait-for-it [host] [port] [timeout(optional)]"
  exit 1
fi

host="$1"
port="$2"
timeout="${3:-0}"
waited=0
delay=2

function try () {
  if type gtimeout > /dev/null 2>&1; then
    gtimeout 1 bash -c "$1"
  else
    timeout 1 bash -c "$1"
  fi
}

until try "> /dev/tcp/$host/$port 2> /dev/null"; do
  if [ "$timeout" -gt 0 ] && [ "$waited" -ge "$timeout" ]; then
    echo "Failed to connect to $host:$port after ${waited}s. Giving up."
    exit 1
  fi

  echo "Waiting for $host:$port... ${waited}s"
  sleep "$delay"
  waited=$(($waited + $delay))
done

echo "$host:$port is available after ${waited}s"