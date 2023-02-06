#!/usr/bin/bash

HW_NUM=$1
ZIP_SECTION1=$2
ZIP_SECTION2=$3

[ ! -d "$HW_NUM" ] && mkdir "$HW_NUM"

unzip "$ZIP_SECTION1" -d "$HW_NUM/"submissions-section1
unzip "$ZIP_SECTION2" -d "$HW_NUM/"submissions-section2
