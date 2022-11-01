#!/bin/bash
# Licensed under GNU GPL V3
my_manifest=# Input here the name of the zip previously downloaded from OTA servers
my_product=
my_bigball=
my_stock=
my_heytap=
my_carrier=
system_vendor=
my_region=
output_folder=# Input here the name of the folder where relevant extracted zip content should be saved to
output_zip=# Input here what should be the name of the generated zip

7z e -y "$my_manifest" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
7z e -y "$my_product" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
7z e -y "$my_bigball" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
7z e -y "$my_stock" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
7z e -y "$my_heytap" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
7z e -y "$my_carrier" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
# system_vendor zip does not contain files with Oplus NV IDs in their name
7z e -y "$system_vendor" *.new.dat* *.transfer.list *.img -o$output_folder
7z e -y "$my_region" *.*.new.dat* *.*.transfer.list *.*.img -o$output_folder
# Removes the 8 digits of Oplus NV ID
rename 's/(\w+)\.(\d+)\.(\w+)/$1.$3/' *

cd $output_folder
7z a -tzip $output_zip *
