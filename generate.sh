#!/bin/sh

file_path="./voc.txt"
number_of_words_required=${1:-3}
# Counts number of linebreaks in txt file
number_of_lines=`wc -l < $file_path`
random_numbers=()

# Function to generate a random number between 1 and number of lines in file
generate_random_number() {
    echo $((1 + RANDOM % number_of_lines))
}

# Generate 5 distinct random numbers between 1 and number of lines in file and store them in the array
while [ ${#random_numbers[@]} -lt $number_of_words_required ]; do
    num=$(generate_random_number)
    found=false
    for existing_num in "${random_numbers[@]}"; do
        if [ "$num" -eq "$existing_num" ]; then
            found=true
            break
        fi
    done
    if [ "$found" = false ]; then
        random_numbers+=("$num")
    fi
done

for number in "${random_numbers[@]}";
do 
    head -n $number $file_path | tail -1
done