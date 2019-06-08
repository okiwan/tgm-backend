#!/usr/bin/env /bin/bash

# General export
echo Exporting tables...
for table in $(mdb-tables $1); do
    mdb-export -d '|' $1 "$table" > "$table.csv"
done

# Modify Main.csv removing first column (old primary key)
echo Altering Main table...
awk ' \
BEGIN \
{FS=OFS="|"} \
{$1=""; sub(/\|/, "")} \
{str=$8; year=substr(str,1,4); month=substr(str,5,2); day=substr(str,7,2); length(str) > 1 ? $8="\""year"-"month"-"day"\"" : ""} \
{str=$9; year=substr(str,1,4); month=substr(str,5,2); day=substr(str,7,2); length(str) > 1 ? $9="\""year"-"month"-"day"\"" : ""} \
{str=$13; year=substr(str,1,4); month=substr(str,5,2); day=substr(str,7,2); length(str) > 1 ? $13="\""year"-"month"-"day"\"" : ""} \
'1 Main.csv > Main.fixed
rm Main.csv
mv Main.fixed Main.csv

echo Done!
