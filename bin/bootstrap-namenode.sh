#!/bin/sh

# Expects 3 parameters
#   1. The number of blocks to generate
#   2. The staging directory to create the XML fsimage in
#   3. The target location for the binary fsimage
set -e


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if (( $# != 3 )); then
    echo "Illegal number of parameters"
    exit 1
fi

ruby $DIR/../block_list/generate_fs_image.rb -b $1  -o $2

hdfs oiv -i $2/fsimage.xml -o $3/fsimage_0000000000000000000  -p ReverseXML
