#!/bin/bash 
## Usage: bash calculate_frequency.sh ./data
FOLDERNAME=$1

# Initialize an array to keep track of files
filesArr=()

# This snippet shows how to view a file
for filename in $(ls ${FOLDERNAME}/*.csv); do
    echo "Viewing ${filename}"
    # Remove attention from the copied file by ignore filename that has "copy"
    if [[ $filename != *"copy"* ]]; then
        # View all rows in this file, skipping the first one
        tail -n +2 $filename # -n + 2 to skip first row
        # Add -e to understand \n is a line breaker
        echo -e "\n"
        # Append to the files array
        filesArr+=($filename)
    fi
done


# This will calculate frequencies of flower species
# But loop over all file in filesArr instead
flowerSpecies=()
for filename in ${filesArr[@]}; do
    # Split each row by comma, and get the last one
    # then append to the array
    # awk: split by comma
    flowerSpecies+=($(awk -F, '{print $5}' $filename | tail -n +2))
done

echo ${flowerSpecies[@]}
# Set \n as delimiter, uniquely count and sort ascendingly
# IFS=$'\n' is to break new line character
# uniq -c: count unique
(IFS=$'\n'; sort <<< "${flowerSpecies[*]}") | uniq -c | sort -nr