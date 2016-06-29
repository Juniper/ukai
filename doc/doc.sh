#!/bin/bash

TOP_DIR=$(cd $(dirname "$0") && pwd)

gohan dot --config-file $TOP_DIR/../gohan.yaml > $TOP_DIR/images/schema.dot

for image in `ls $TOP_DIR/images/*.dot`; do
  file="${image##*/}"
  name="${file%.*}"
  dot $TOP_DIR/images/$name.dot -Tpng -o $TOP_DIR/images/$name.png
done;

gohan markdown --config-file $TOP_DIR/../gohan.yaml > $TOP_DIR/api.md