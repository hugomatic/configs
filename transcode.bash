#!/usr/bin/env bash

# recordmydesktop generates out.ogv
# this script creates out.mp4

input="out"
if [ -z "$1" ]
  then
    echo "no input name supplied"
  else
    input=$1
fi

output="out"
if [ -z "$2" ]
  then
    echo "no output name supplied"
  else
    output=$2
fi

echo
echo "input: $input.ogv"
echo "output: $output.mp4 and $output.ogv"
echo

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}


/usr/bin/ffmpeg -y -i $input.ogv -s 1280x720 -aspect 16:9 -r 30000/1001 -b 2M -bt 4M -pass 1 -vcodec libx264 -threads 0 -an -f mp4 -loglevel verbose "./$output.mp4"
cp "$input.ogv" "$output.ogv"

