#!/bin/sh
real_path=$(cd $(dirname $0); pwd)
coffee -b -o $real_path/build -c $real_path/src/eorzea_time.coffee
