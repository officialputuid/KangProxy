#!/bin/bash

input_file="RAW.txt"
output_file="clean_RAW.txt"
awk -F: '{NF=NF-1}1' OFS=":" "$input_file" > "$output_file"
