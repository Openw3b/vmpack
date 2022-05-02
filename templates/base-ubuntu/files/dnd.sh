#! /bin/sh

dir=/home/user/.dragon/`echo $RANDOM | md5sum | head -c 20`
mkdir -p $dir
mv /home/user/.share/* $dir/
dragon --and-exit $dir/*
sleep 60
rm -rf $dir